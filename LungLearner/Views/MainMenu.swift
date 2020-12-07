//
//  MainMenu.swift
//  LungLearner
//
//  Created by frank shen on 10/2/20.
//

import SwiftUI
import GoogleSignIn


struct SignInButton: UIViewRepresentable {
    func makeUIView(context: Context) -> GIDSignInButton {
        let button = GIDSignInButton()
        button.colorScheme = .light
        return button
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct MainMenu: View {
    @EnvironmentObject var googleDelegate: GoogleDelegate
    @State var timeOfDay: String = {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
            case 5..<12 : return "morning"
            case 12..<17 : return "afternoon"
            default : return "evening"
        }
    }()
    @State var showInstructions: Bool = false
    @State var blurBackground: Bool = false
    
    @State var selectedDifficulty: Difficulty? = nil
    
    var body: some View {
            Group {
                if googleDelegate.signedIn {
                    ZStack {
                        NavigationView {
                            VStack {
                                Image("Logo")
                                    .resizable()
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .padding(.bottom)
                                Text("Good \(timeOfDay) \(GIDSignIn.sharedInstance().currentUser!.profile.name)!")
                                    .font(.system(size: 25))
                                    .padding(.bottom, 30)

                                DifficultyButtons(selectedDifficulty: $selectedDifficulty)
                                NavigationLink(
                                    destination: History(difficulty: selectedDifficulty)) {
                                    Text("New Case")
                                        .font(.system(size: 20))
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                }
                                .buttonStyle(WideButtonStyle())
                                .padding(.bottom, 20)
                                .padding(.horizontal, 30)
                                
                                NavigationLink(
                                    destination: Progress()) {
                                    Text("Review")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                }
                                .buttonStyle(WideButtonStyle())
                                .padding(.bottom, 20)
                                .padding(.horizontal, 30)
                                
                                Spacer()
                                Button(action: {
                                    self.showInstructions.toggle()
                                    self.blurBackground.toggle()
                                }) {
                                    Image(systemName: "questionmark.circle")
                                        .foregroundColor(Color.hotPink)
                                        .font(.system(size: 30))
                                }
                                .padding(.bottom)
                                HStack {
                                    Text("Signed in as \(GIDSignIn.sharedInstance().currentUser!.profile.email)")
                                    AsyncImage(url: GIDSignIn.sharedInstance().currentUser!.profile.imageURL(withDimension: 40))
                                        .clipShape(Circle())
                                        .frame(width: 40, height: 40)
                                }
                                Button(action: {
                                    GIDSignIn.sharedInstance().signOut()
                                    googleDelegate.signedIn = false
                                }) {
                                    Text("Sign Out")
                                        .foregroundColor(Color.hotPink)
                                }
                                .padding(.bottom, 20)
                            }
                        }
                        .background(Color.lighterGray.ignoresSafeArea())
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                        .blur(radius: self.blurBackground ? 5 : 0)
                        
                        if self.showInstructions {
                            ZStack {
                                Color.white
                                VStack {
                                    
                                    TabView {
                                        InstructionTab(image: "waveform.path.ecg", description: "Use Lung Learner to practice diagnosing patients with respiratory failure.")
                                        InstructionTab(image: "bed.double.fill", description: "Select New Case to try out a new case.")
                                        InstructionTab(image: "rectangle.stack.person.crop.fill", description: "Or select Review to check your progress and review old cases.")
                                        InstructionTab(image: "timer", description: "Even though efficient diagnoses are valuable, remember not to rush.")
                                        InstructionTab(image: "calendar", description: "Consistency is key. Be thorough, and keep practicing!")
                                    }
                                    .tabViewStyle(PageTabViewStyle())
                                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                                    
                                    Spacer()
                                    ClosePopUpButton(showCategory: $showInstructions, blurBackground: $blurBackground)
                                }
                                .padding()
                            }
                            .frame(height: 375)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .cornerRadius(20).shadow(radius: 20)
                            .padding(.horizontal)
                        }
                        
                    }
                } else {
                    VStack {
                        Image("Logo")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .padding(.bottom, 30)
                            .padding(.top, 100)
                        Button(action: {
                            GIDSignIn.sharedInstance().signIn()
                        }) {
                            Text("Sign In")
                                .font(.system(size: 20))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        .buttonStyle(WideButtonStyle())
                        .padding(.horizontal, 30)
                        Spacer()
                    }
                }
            }
            .onAppear {
                GIDSignIn.sharedInstance().restorePreviousSignIn()
            }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
            .environmentObject(Steps())
    }
}
