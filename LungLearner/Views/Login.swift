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
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
            Button(action: {
                // TODO: Insert Login functionality
            }) {
                Text("Login")
                    .font(.system(size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .buttonStyle(WideButtonStyle())
            .padding(.horizontal, 30)
            Spacer()
        }
        .background(Color.lighterGray.ignoresSafeArea())
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
