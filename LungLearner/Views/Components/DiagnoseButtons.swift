//
//  DiagnoseButtons.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/3/20.
//

import SwiftUI

struct DiagnoseButtons: View {
    @Binding var stepsList: [String]
    var index: Int
    var noUnsure: Bool = false
    
    var body: some View {
        if noUnsure {
            VStack {
                Group {
                Button(action: {
                    stepsList[index] = "Heart failure"
                }) {
                    Text("Heart Failure")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .buttonStyle(NarrowButtonStyle())
                Button(action: {
                    stepsList[index] = "COPD"
                }) {
                    Text("COPD")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .buttonStyle(NarrowButtonStyle())
                Button(action: {
                    stepsList[index] = "Pneumonia"
                }) {
                    Text("Pneumonia")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .buttonStyle(NarrowButtonStyle())
                }
                .padding(.vertical, 5)
            }
            .padding(.horizontal, 100)
            .padding(.bottom)
        }
        else {
            VStack {
                HStack {
                    Button(action: {
                        stepsList[index] = "Heart failure"
                    }) {
                        Text("Heart Failure")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .buttonStyle(NarrowButtonStyle())
                    .padding(.leading, 30)
                    Button(action: {
                        stepsList[index] = "COPD"
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
                        stepsList[index] = "Pneumonia"
                    }) {
                        Text("Pneumonia")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .buttonStyle(NarrowButtonStyle())
                    .padding(.leading, 30)
                    Button(action: {
                        stepsList[index] = "Unsure"
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
}

