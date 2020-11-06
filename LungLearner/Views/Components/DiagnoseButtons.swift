//
//  DiagnoseButtons.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/3/20.
//

import SwiftUI

struct DiagnoseButtons: View {
    @Binding var selectedCause: String
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    selectedCause = "CHF"
                }) {
                    Text("CHF")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .buttonStyle(NarrowButtonStyle())
                .padding(.leading, 30)
                Button(action: {
                    selectedCause = "COPD"
                }) {
                    Text("COPD")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .buttonStyle(NarrowButtonStyle())
                .padding(.trailing, 30)
            }
            .padding(.bottom, 5)
            HStack {
                Button(action: {
                    selectedCause = "Pneumonia"
                }) {
                    Text("Pneumonia")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .buttonStyle(NarrowButtonStyle())
                .padding(.leading, 30)
                Button(action: {
                    selectedCause = "Unsure"
                }) {
                    Text("Unsure")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .buttonStyle(NarrowButtonStyle())
                .padding(.trailing, 30)
            }
        }
    }
}

