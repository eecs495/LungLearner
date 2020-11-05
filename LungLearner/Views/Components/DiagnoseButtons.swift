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
                }
                .buttonStyle(NarrowButtonStyle())
                .padding(.leading, 15)
                Button(action: {
                    selectedCause = "COPD"
                }) {
                    Text("COPD")
                }
                .buttonStyle(NarrowButtonStyle())
                .padding(.trailing, 15)
            }
            .padding(.bottom, 5)
            HStack {
                Button(action: {
                    selectedCause = "Pneumonia"
                }) {
                    Text("Pneumonia")
                }
                .buttonStyle(NarrowButtonStyle())
                .padding(.leading, 15)
                Button(action: {
                    selectedCause = "Unsure"
                }) {
                    Text("Unsure")
                }
                .buttonStyle(NarrowButtonStyle())
                .padding(.trailing, 15)
            }
        }
    }
}

