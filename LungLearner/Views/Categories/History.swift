//
//  History.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct History: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause = 0
    var caseData: CaseData
    
    var body: some View {
        ScrollView {
            VStack {
                HistoryText(caseData: caseData)
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
                NavigationLink(destination: Symptoms(caseData: caseData)) {
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

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History(caseData: testCaseData).environmentObject(Steps())
    }
}

struct HistoryText: View {
    var caseData: CaseData
    
    var body: some View {
        Text("History")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding(.top, 30)
            .padding(.bottom)
        Text("Your patient is a \(caseData.age) year old \(caseData.gender) with a past medical history of \(caseData.history1), \(caseData.history2), and \(caseData.history3). Tobacco use is \(caseData.tobaccoUse).")
            .multilineTextAlignment(.leading)
            .font(.body)
            .foregroundColor(.secondary)
    }
}
