//
//  LabValues.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct LabValues: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause = 0
    var caseData: CaseData
    
    var body: some View {
        ScrollView {
            VStack {
                LabValuesText(caseData: caseData)
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
                NavigationLink(destination: XRay(caseData: caseData)) {
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

struct LabValues_Previews: PreviewProvider {
    static var previews: some View {
        LabValues(caseData: testCaseData1).environmentObject(Steps())
    }
}

struct BloodDataBlocks: View {
    var caseData: CaseData
    
    var body: some View {
        DataBlock(title: "White Blood Cells", description: "\(caseData.labExamData.whiteBloodCells)", horizontal: true)
        DataBlock(title: "Hemoglobin", description: "\(caseData.labExamData.hemoglobin)", horizontal: true)
        DataBlock(title: "Hematocrit", description: "\(caseData.labExamData.hematocrit)", horizontal: true)
        DataBlock(title: "Platelets", description: "\(caseData.labExamData.platelets)", horizontal: true, last: true)
    }
}

struct ChemicalDataBlocks: View {
    var caseData: CaseData
    
    var body: some View {
        DataBlock(title: "Sodium", description: "\(caseData.labExamData.sodium)", horizontal: true)
        DataBlock(title: "Potassium", description: "\(caseData.labExamData.potassium)", horizontal: true)
        DataBlock(title: "Chloride", description: "\(caseData.labExamData.chloride)", horizontal: true)
        DataBlock(title: "Bicarbonate", description: "\(caseData.labExamData.bicarbonate)", horizontal: true)
        DataBlock(title: "BUN", description: "\(caseData.labExamData.bun)", horizontal: true)
        DataBlock(title: "Creatinine", description: "\(caseData.labExamData.creatinine)", horizontal: true)
        DataBlock(title: "Glucose", description: "\(caseData.labExamData.glucose)", horizontal: true)
        DataBlock(title: "BNP", description: "\(caseData.labExamData.bnp)", horizontal: true, last: true)
    }
}

struct ABGDataBlocks: View {
    var caseData: CaseData
    
    var body: some View {
        DataBlock(title: "ABG - pH", description: "\(caseData.labExamData.abgPh)", horizontal: true)
        DataBlock(title: "ABG - pCO2", description: "\(caseData.labExamData.abgPCo2)", horizontal: true)
        DataBlock(title: "ABG - pO2", description: "\(caseData.labExamData.abgPO2)", horizontal: true, last: true)
    }
}

struct LabValuesText: View {
    var caseData: CaseData
    
    var body: some View {
        Text("Lab Values")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding(.top, 30)
            .padding(.bottom)
        VStack(alignment: .leading) {
            BloodDataBlocks(caseData: caseData)
            ChemicalDataBlocks(caseData: caseData)
            ABGDataBlocks(caseData: caseData)
            DataBlock(title: "Lactate", description: "\(caseData.labExamData.lactate)", horizontal: true, last: true)
        }
    }
}
