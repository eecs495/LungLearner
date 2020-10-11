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
                Text("History")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 40)
                    .padding(.bottom)
                Text(caseData.history)
                    .multilineTextAlignment(.leading)
                    .font(.body)
                    .foregroundColor(.secondary)
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
