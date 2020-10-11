//
//  Symptoms.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct Symptoms: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause = 0
    var caseData: CaseData
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Symptoms")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 40)
                    .padding(.bottom)
                VStack(alignment: .leading) {
                    Text("Temperature")
                    Text("\(caseData.symptoms.temperature)")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                    Text("Heart Rate")
                    Text("\(caseData.symptoms.heartRate)")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                    Text("Respiratory Rate")
                    Text("\(caseData.symptoms.respiratoryRate)")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                    Text("Blood Pressure")
                    Text("\(caseData.symptoms.bloodPressure)")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                    Text("Oxygen Saturation")
                    Text("\(caseData.symptoms.oxygenSaturation)")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 30)
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
                NavigationLink(destination: PhysicalExam(caseData: caseData)) {
                    Image(systemName: "arrow.right")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                        .padding()
                        .padding(.bottom, 30)
                }
                .simultaneousGesture(TapGesture().onEnded{
                    steps.stepList.append(causes[selectedCause])
                })
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct Symptoms_Previews: PreviewProvider {
    static var previews: some View {
        Symptoms(caseData: testCaseData).environmentObject(Steps())
    }
}
