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
                SymptomsText(caseData: caseData)
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
        Symptoms(caseData: testCaseData1).environmentObject(Steps())
    }
}

struct SymptomsText: View {
    var caseData: CaseData
    
    var body: some View {
        Text("Symptoms")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding(.top, 30)
            .padding(.bottom)
        VStack(alignment: .leading) {
            Text("Your patient has had \(caseData.symptomData.durationSymptoms), \(caseData.symptomData.severitySymptoms) symptoms of \(caseData.symptomData.descriptionSymptoms) for \(caseData.symptomData.onsetSymptoms). The provocating factor is \(caseData.symptomData.provocatingFactors) and the relieving factor is \(caseData.symptomData.relievingFactors).")
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.bottom)
            DataBlock(title: "Temperature", description: "\(caseData.symptomValuesData.temperature)")
            DataBlock(title: "Heart Rate", description: "\(caseData.symptomValuesData.heartRate)")
            DataBlock(title: "Respiratory Rate", description: "\(caseData.symptomValuesData.respiratoryRate)")
            DataBlock(title: "Blood Pressure", description: "\(caseData.symptomValuesData.bloodPressure)")
            DataBlock(title: "Oxygen Saturation", description: "\(caseData.symptomValuesData.oxygenSaturation)")
            DataBlock(title: "Oxygen Received", description: "\(caseData.symptomValuesData.amountOfOxygenReceived)", last: true)
        }
    }
}
