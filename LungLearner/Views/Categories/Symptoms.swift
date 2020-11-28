//
//  Symptoms.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct Symptoms: View {
    var caseData: CaseData
    @Binding var stepsList: [String]
    
    @State var secondsHere: Int = 0
    var secondsTotal: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(caseData: CaseData, secondsTotal: Int, stepsList: Binding<[String]>){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(Color.lighterGray)
        UIScrollView.appearance().backgroundColor = UIColor(Color.lighterGray)
        self.caseData = caseData
        self.secondsTotal = secondsTotal
        _stepsList = stepsList
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ProgressCircles(coloredIndex: 1)
                    DiagnoseTimer(secondsHere: secondsHere, secondsTotal: secondsTotal)
                    .onReceive(timer) { _ in
                        self.secondsHere += 1
                    }
                }
                SymptomsText(caseData: caseData)
                Spacer()
                VStack {
                    HStack {
                        Text("My current diagnosis is")
                            .font(.system(size: 20))
                        Text(stepsList[1])
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.hotPink)
                    }
                    .padding(.vertical)
                    DiagnoseButtons(stepsList: $stepsList, index: 1)
                    NavigationLink(destination: PhysicalExam(caseData: caseData, secondsTotal: secondsHere + secondsTotal, stepsList: $stepsList)) {
                        HStack {
                            Text("Physical Exam")
                                .foregroundColor(Color.hotPink)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.hotPink)
                        }
                        .padding(.vertical)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct Symptoms_Previews: PreviewProvider {
    static var previews: some View {
        
        Symptoms(caseData: testCaseData1, secondsTotal: 20, stepsList: .constant(testStepsList))
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
    
    func BuildDescriptionFromCaseData() -> String {
        var description: String = "Your patient's symptoms are \(caseData.symptomData.descriptionSymptoms). The onset of these symptoms is \(caseData.symptomData.onsetSymptoms)."
        if caseData.symptomData.provocatingFactors != "" {
            description += " Provocating factors include \(caseData.symptomData.provocatingFactors)."
        }
        return description
    }
    
    var body: some View {
            Group {
                Text(BuildDescriptionFromCaseData())
                    .textStyle(WhiteCard())
                DataBlock(title: "Temperature", description: "\(caseData.symptomValuesData.temperature)", unit: "C")
                DataBlock(title: "Heart Rate", description: "\(caseData.symptomValuesData.heartRate)", unit: "beats per minute")
                DataBlock(title: "Respiratory Rate", description: "\(caseData.symptomValuesData.respiratoryRate)", unit: "breaths per minute")
                DataBlock(title: "Blood Pressure", description: "\(caseData.symptomValuesData.bloodPressure)", unit: "mm Hg")
                DataBlock(title: "Oxygen Saturation", description: "\(caseData.symptomValuesData.oxygenSaturation)")
                DataBlock(title: "Oxygen Received", description: "\(caseData.symptomValuesData.amountOfOxygenReceived)")
            }
            .padding(.bottom, 5)
    }
}
