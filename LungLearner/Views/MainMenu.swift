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
        // Customize button here
        button.colorScheme = .light
        return button
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct MainMenu: View {
    @EnvironmentObject var googleDelegate: GoogleDelegate
    @State var caseData: CaseData? = {
        do {
            return try CaseDatabaseManager.shared.getRandomCase()
        } catch CaseError.runtimeError(let errorMessage) {
            print(errorMessage)
            return nil
        } catch {
            print("Other errors")
            return nil
        }
    }()
    @State var timeOfDay: String = {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
            case 5..<12 : return "morning"
            case 12..<17 : return "afternoon"
            default : return "evening"
        }
    }()
    
    var body: some View {
        Group {
            if googleDelegate.signedIn {
                NavigationView {
                    VStack {
                        Image("Logo")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .padding(.bottom)
                        Text("Good \(timeOfDay) \(GIDSignIn.sharedInstance().currentUser!.profile.name)!")
                            .font(.system(size: 25))
                            .padding(.bottom, 20)
                        NavigationLink(
                            destination: History(caseData: caseData!)) {
                            Text("New Case")
                                .font(.system(size: 20))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        .buttonStyle(WideButtonStyle())
                        .padding(.bottom)
                        .padding(.horizontal, 30)
                        NavigationLink(
                            destination: Progress()) {
                            Text("Review")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                        .buttonStyle(WideButtonStyle())
                        .padding(.horizontal, 30)
                        Spacer()
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
            } else {
                VStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding(.bottom, 30)
                        .padding(.top, 100)
                    Button(action: {
                        GIDSignIn.sharedInstance().signIn()
                        //self.showingWelcome = true
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
        .background(LoginViewController())
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
            .environmentObject(Steps())
            //.environmentObject(TimeToDiagnose())
    }
}
