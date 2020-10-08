//
//  ContentView.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import SwiftUI


let causes = ["CHF", "COPD", "Pneuomnia", "Unsure"]

struct NewCase: View {
    
    @State private var category: String = "History"
    @State var process: [String] = []
    @State var selectedCause: Int = 0

    var body: some View {
        switch category {
        case "History":
            ScrollView {
                VStack {
                    History()
                        .padding(.top)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "Symptoms")
                }
            }
        case "Symptoms":
            ScrollView {
                VStack {
                    Symptoms()
                        .padding(.top)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "PhysicalExam")
                }
            }
        case "PhysicalExam":
            ScrollView {
                VStack {
                    PhysicalExam()
                        .padding(.top)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "LabValues")
                }
            }
        case "LabValues":
            ScrollView {
                VStack {
                    LabValues()
                        .padding(.top)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "ArterialBloodGas")
                }
            }
        case "ArterialBloodGas":
            ScrollView {
                VStack {
                    ArterialBloodGas()
                        .padding(.top)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "XRay")
                }
            }
        case "XRay":
            ScrollView {
                VStack {
                    XRay()
                        .padding(.top)
                    CausePicker(selectedCause: $selectedCause)
                    NextButton(category: $category, selectedCause: $selectedCause, process: $process,  nextCategory: "Default")
                }
            }
        default:
            VStack {
                Text("Your Diagnostic Process:")
                ForEach(process, id: \.self) { step in
                    Text(step)
                }
            }
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
            category = nextCategory
            process.append(causes[selectedCause])
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
