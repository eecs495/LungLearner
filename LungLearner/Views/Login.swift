//
//  Login.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/1/20.
//

import SwiftUI
import GoogleSignIn


struct Login: View {
    @EnvironmentObject var googleDelegate: GoogleDelegate

    
    var body: some View {
        //LoginViewController()
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
        .background(LoginViewController())
    }
}
