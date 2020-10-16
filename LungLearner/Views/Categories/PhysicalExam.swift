//
//  PhysicalExam.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct PhysicalExam: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause = 0
    var caseData: CaseData
    
    var body: some View {
        ScrollView {
            VStack {
                PhysicalExamText(caseData: caseData)
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
                NavigationLink(destination: LabValues(caseData: caseData)) {
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

struct PhysicalExam_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalExam(caseData: testCaseData).environmentObject(Steps())
    }
}

struct PhysicalExamDataBlocks: View {
    var caseData: CaseData
    
    var body: some View {
        DataBlock(title: "General", description: "\(caseData.physicalExamData.general)")
        DataBlock(title: "Head", description: "\(caseData.physicalExamData.head)")
        DataBlock(title: "Neck", description: "\(caseData.physicalExamData.neck)")
        DataBlock(title: "Heart", description: "\(caseData.physicalExamData.heart)")
        DataBlock(title: "Lungs", description: "\(caseData.physicalExamData.lungs)")
        DataBlock(title: "Abdomen", description: "\(caseData.physicalExamData.abdomen)")
        DataBlock(title: "Extremities", description: "\(caseData.physicalExamData.extremities)")
        DataBlock(title: "Skin", description: "\(caseData.physicalExamData.skin)", last: true)
    }
}

struct PhysicalExamText: View {
    var caseData: CaseData
    
    var body: some View {
        Text("Physical Exam")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding(.top, 30)
            .padding(.bottom)
        VStack(alignment: .leading) {
            PhysicalExamDataBlocks(caseData: caseData)
        }
    }
}
