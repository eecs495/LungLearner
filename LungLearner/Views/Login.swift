//
//  Login.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/1/20.
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

struct Login: View {
    @EnvironmentObject var googleDelegate: GoogleDelegate
    
    var body: some View {
        Group {
            if googleDelegate.signedIn {
                VStack {
                    Text(GIDSignIn.sharedInstance().currentUser!.profile.name)
                    Text(GIDSignIn.sharedInstance().currentUser!.profile.email)
                    Button(action: {
                        GIDSignIn.sharedInstance().signOut()
                        googleDelegate.signedIn = false
                    }) {
                        Text("Sign Out")
                    }
                }
            } else {
                Button(action: {
                    GIDSignIn.sharedInstance().signIn()
                }) {
                    Text("Sign In")
                }
            }
        }
        .onAppear {
                GIDSignIn.sharedInstance().restorePreviousSignIn()
            }
//        VStack {
//            SignInButton()
//            Spacer()
//            Image("Logo")
//                .resizable()
//                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .padding(.bottom)
//            Button(action: {
//                GIDSignIn.sharedInstance().signIn()
//            }) {
//                Text("Login")
//                    .font(.system(size: 20))
//                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//            }
//            .buttonStyle(WideButtonStyle())
//            .padding(.horizontal, 30)
//            Spacer()
//        }
//        .background(Color.lighterGray.ignoresSafeArea())
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
