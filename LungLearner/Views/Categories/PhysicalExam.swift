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
                Text("Physical Exam")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 40)
                    .padding(.bottom)
                VStack(alignment: .leading) {
                    Text("General")
                    Text("\(caseData.exam.general)")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                    Text("Cardiovascular")
                    Text("\(caseData.exam.cardiovascular)")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                    Text("Chest")
                    Text("\(caseData.exam.chest)")
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
