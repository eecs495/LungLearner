//
//  Symptoms.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct Symptoms: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause: String = "Unsure"
    var caseData: CaseData
    
    init(caseData: CaseData){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(Color.lighterGray)
        UIScrollView.appearance().backgroundColor = UIColor(Color.lighterGray)
        self.caseData = caseData
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProgressCircles(coloredIndex: 1)
                SymptomsText(caseData: caseData)
                Spacer()
                VStack {
                    HStack {
                        Text("My current diagnosis is")
                            .font(.system(size: 20))
                        Text(selectedCause)
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.hotPink)
                    }
                    .padding(.vertical)
                    DiagnoseButtons(selectedCause: $selectedCause)
                    NavigationLink(destination: PhysicalExam(caseData: caseData)) {
                        HStack {
                            Text("Physical Exam")
                                .foregroundColor(Color.hotPink)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.hotPink)
                        }
                        .padding(.vertical)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        steps.stepList.append(selectedCause)
                    })
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
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
            VStack(alignment: .leading) {
                Text("Symptoms")
                    .font(.system(size: 35))
                    .fontWeight(.semibold)
                    .padding(.bottom, 5)
                SymptomsTextBody(caseData: caseData)
            }
            .padding(.horizontal, 30)
    }
}

struct SymptomsTextBody: View {
    var caseData: CaseData
    
    var body: some View {
            Group {
                Text("Your patient has had \(caseData.symptomData.durationSymptoms), \(caseData.symptomData.severitySymptoms) symptoms of \(caseData.symptomData.descriptionSymptoms) for \(caseData.symptomData.onsetSymptoms). The provocating factor is \(caseData.symptomData.provocatingFactors) and the relieving factor is \(caseData.symptomData.relievingFactors).")
                    .textStyle(WhiteCard())
                DataBlock(title: "Temperature", description: "\(caseData.symptomValuesData.temperature)")
                DataBlock(title: "Heart Rate", description: "\(caseData.symptomValuesData.heartRate)")
                DataBlock(title: "Respiratory Rate", description: "\(caseData.symptomValuesData.respiratoryRate)")
                DataBlock(title: "Blood Pressure", description: "\(caseData.symptomValuesData.bloodPressure)")
                DataBlock(title: "Oxygen Saturation", description: "\(caseData.symptomValuesData.oxygenSaturation)")
                DataBlock(title: "Oxygen Received", description: "\(caseData.symptomValuesData.amountOfOxygenReceived)")
            }
            .padding(.bottom, 5)
    }
}
