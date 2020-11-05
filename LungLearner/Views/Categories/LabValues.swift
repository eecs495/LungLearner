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
    
    var body: some View {
        VStack {
            ProgressCircles(coloredIndex: 3)
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
                .padding(.bottom)
                DiagnoseButtons(selectedCause: $selectedCause)
                NavigationLink(destination: XRay(caseData: caseData)) {
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

struct LabValues_Previews: PreviewProvider {
    static var previews: some View {
        LabValues(caseData: testCaseData1).environmentObject(Steps())
    }
}

struct BloodDataBlocks: View {
    var caseData: CaseData
    
    var body: some View {
        DataBlock(title: "White Blood Cells", description: "\(caseData.labExamData.whiteBloodCells)")
        DataBlock(title: "Hemoglobin", description: "\(caseData.labExamData.hemoglobin)")
        DataBlock(title: "Hematocrit", description: "\(caseData.labExamData.hematocrit)")
        DataBlock(title: "Platelets", description: "\(caseData.labExamData.platelets)")
    }
}

struct ChemicalDataBlocks: View {
    var caseData: CaseData
    
    var body: some View {
        DataBlock(title: "Sodium", description: "\(caseData.labExamData.sodium)")
        DataBlock(title: "Potassium", description: "\(caseData.labExamData.potassium)")
        DataBlock(title: "Chloride", description: "\(caseData.labExamData.chloride)")
        DataBlock(title: "Bicarbonate", description: "\(caseData.labExamData.bicarbonate)")
        DataBlock(title: "BUN", description: "\(caseData.labExamData.bun)")
        DataBlock(title: "Creatinine", description: "\(caseData.labExamData.creatinine)")
        DataBlock(title: "Glucose", description: "\(caseData.labExamData.glucose)")
        DataBlock(title: "BNP", description: "\(caseData.labExamData.bnp)")
    }
}

struct ABGDataBlocks: View {
    var caseData: CaseData
    
    var body: some View {
        DataBlock(title: "ABG - pH", description: "\(caseData.labExamData.abgPh)")
        DataBlock(title: "ABG - pCO2", description: "\(caseData.labExamData.abgPCo2)")
        DataBlock(title: "ABG - pO2", description: "\(caseData.labExamData.abgPO2)")
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
            Text("Your patient's lab results are recorded below.")
                .padding(.bottom, 5)
            BloodDataBlocks(caseData: caseData)
            ChemicalDataBlocks(caseData: caseData)
            ABGDataBlocks(caseData: caseData)
            DataBlock(title: "Lactate", description: "\(caseData.labExamData.lactate)")
        }
    }
}
