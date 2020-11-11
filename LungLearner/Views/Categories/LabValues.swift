//
//  LabValues.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct LabValues: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause: String = "Unsure"
    @State var showImage: Bool = false
    var caseData: CaseData
    
    @State var secondsHere: Int = 0
    var secondsTotal: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(caseData: CaseData, secondsTotal: Int){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(Color.lighterGray)
        UIScrollView.appearance().backgroundColor = UIColor(Color.lighterGray)
        self.caseData = caseData
        self.secondsTotal = secondsTotal
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ProgressCircles(coloredIndex: 3)
                    DiagnoseTimer(secondsHere: secondsHere, secondsTotal: secondsTotal)
                    .onReceive(timer) { _ in
                        self.secondsHere += 1
                    }
                }
                LabValuesText(caseData: caseData)
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
                    NavigationLink(destination: XRay(caseData: caseData, secondsTotal: secondsHere + secondsTotal)) {
                        HStack {
                            Text("X-Ray")
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

struct LabValues_Previews: PreviewProvider {
    static var previews: some View {
        LabValues(caseData: testCaseData1, secondsTotal: 200).environmentObject(Steps())
    }
}

struct BloodDataBlocks: View {
    var caseData: CaseData
    
    var body: some View {
        DataBlock(title: "White Blood Cells", description: "\(caseData.labExamData.whiteBloodCells)", unit: "K/ul")
        DataBlock(title: "Hemoglobin", description: "\(caseData.labExamData.hemoglobin)", unit: "g/dL")
        DataBlock(title: "Hematocrit", description: "\(caseData.labExamData.hematocrit)%")
        DataBlock(title: "Platelets", description: "\(caseData.labExamData.platelets)", unit: "K/ul")
    }
}

struct ChemicalDataBlocks: View {
    var caseData: CaseData
    
    var body: some View {
        DataBlock(title: "Sodium", description: "\(caseData.labExamData.sodium)", unit: "mmol/L")
        DataBlock(title: "Potassium", description: "\(caseData.labExamData.potassium)", unit: "mmol/L")
        DataBlock(title: "Chloride", description: "\(caseData.labExamData.chloride)", unit: "mmol/L")
        DataBlock(title: "Bicarbonate", description: "\(caseData.labExamData.bicarbonate)", unit: "mmol/L")
        DataBlock(title: "BUN", description: "\(caseData.labExamData.bun)", unit: "mg/dL")
        DataBlock(title: "Creatinine", description: "\(caseData.labExamData.creatinine)", unit: "mg/dL")
        DataBlock(title: "Glucose", description: "\(caseData.labExamData.glucose)", unit: "mg/dL")
        DataBlock(title: "BNP", description: "\(caseData.labExamData.bnp)", unit: "pg/mL")
    }
}

struct ABGDataBlocks: View {
    var caseData: CaseData
    
    var body: some View {
        DataBlock(title: "ABG - pH", description: "\(caseData.labExamData.abgPh)")
        DataBlock(title: "ABG - pCO2", description: "\(caseData.labExamData.abgPCo2)", unit: "mmHg")
        DataBlock(title: "ABG - pO2", description: "\(caseData.labExamData.abgPO2)", unit: "mmHg")
    }
}

struct LabValuesText: View {
    var caseData: CaseData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Lab Values")
                .font(.system(size: 35))
                .fontWeight(.semibold)
                .padding(.bottom, 5)
            LabValuesTextBody(caseData: caseData)
        }
        .padding(.horizontal, 30)
    }
}

struct LabValuesTextBody: View {
    var caseData: CaseData
    
    var body: some View {
        Group {
            BloodDataBlocks(caseData: caseData)
            ChemicalDataBlocks(caseData: caseData)
            ABGDataBlocks(caseData: caseData)
            DataBlock(title: "Lactate", description: "\(caseData.labExamData.lactate)", unit: "mmol/L")
        }
        .padding(.bottom, 5)
    }
}
