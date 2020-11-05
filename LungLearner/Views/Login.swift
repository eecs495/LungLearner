//
//  Login.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/1/20.
//

import SwiftUI

struct Login: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Welcome to Lung Learner!")
                .font(.system(size: 20))
                .fontWeight(.light)
                .foregroundColor(.pink)
            Button(action: {
                // TODO: Insert Login functionality
            }) {
                Text("Login")
            }
            .buttonStyle(WideButtonStyle())
            .padding(.horizontal, 30)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
