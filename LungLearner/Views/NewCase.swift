//
//  ContentView.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import SwiftUI

struct ViewData {
    var viewName: String
    var nextViewName: String
}

//let causes = ["CHF", "COPD", "Pneuomnia", "Unsure"]
    

struct NewCase: View {
    
    @State private var category: String = "History"
    @State var process: [String] = []
    @State var selectedCause: Int = 0

    var body: some View {
        if category == "History" {
            ScrollView {
                VStack {
                    History(canGoBack: false)
                        .padding(.top, 40)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "Symptoms")
                        .padding(.bottom)
                }
            }
        }
        if category == "Symptoms" {
            ScrollView {
                VStack {
                    Symptoms()
                        .padding(.top, 40)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "PhysicalExam")
                        .padding(.bottom)
                }
            }
        }
        if category == "PhysicalExam" {
            ScrollView {
                VStack {
                    PhysicalExam()
                        .padding(.top, 40)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "LabValues")
                        .padding(.bottom)
                }
            }
        }
        if category == "LabValues" {
            ScrollView {
                VStack {
                    LabValues()
                        .padding(.top, 40)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "ArterialBloodGas")
                        .padding(.bottom)
                }
            }
        }
        if category == "ArterialBloodGas" {
            ScrollView {
                VStack {
                    ArterialBloodGas()
                        .padding(.top, 40)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "XRay")
                }
            }
        }
        if category == "XRay" {
            ScrollView {
                VStack {
                    XRay()
                        .padding(.top, 40)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "Default")
                        .padding(.bottom)
                }
            }
        }
        if category == "Default" {
            ReviewCase()
        }
    }
}

struct NextButton: View {
    @Binding var category: String
    @Binding var selectedCause: Int
    @Binding var process: [String]
    
    var nextCategory: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                category = nextCategory
                process.append(causes[selectedCause])
            }
        }) {
            Image(systemName: "arrow.right")
                .font(.largeTitle)
                .foregroundColor(Color.black)
                .padding()
        }
    }
}

struct CausePicker: View {
    @Binding var selectedCause: Int

    var body: some View {
       VStack {
            Picker(selection: $selectedCause, label: Text("Please choose a color")) {
                ForEach(0 ..< causes.count) {
                    Text(causes[$0])
                }
            }
        Text("Current Diagnosis")
            .bold()
            .padding(.bottom, 2)
        Text("\(causes[selectedCause])")
            .font(.body)
            .foregroundColor(.accentColor)
       }
    }
}

struct NewCase_Previews: PreviewProvider {
    static var previews: some View {
        NewCase()
    }
}


