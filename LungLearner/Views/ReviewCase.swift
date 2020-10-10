//
//  ReviewCase.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/9/20.
//

import SwiftUI

let causeNames: [String] = ["History", "Symptoms", "Physical Exam", "Lab Values", "Arterial Blood Gas", "X-Ray"]

struct ReviewCase: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Your Diagnostic Process")
                .bold()
                .padding(.bottom, 2)
            VStack(alignment: .leading) {
                ForEach((0...5), id: \.self) {
                    Text("\(steps.stepList[$0]) after \(causeNames[$0])")
                        .font(.body)
                        .foregroundColor(.accentColor)
                    }
            }
            Picker(selection: $selectedCause, label: Text("Please choose a color")) {
                ForEach(0 ..< causes.count) {
                    Text(causes[$0])
                }
            }
            Text("Final Diagnosis")
                .bold()
                .padding(.bottom, 2)
            Text("\(causes[selectedCause])")
                .font(.body)
                .foregroundColor(.accentColor)
                .padding(.bottom)
            NavigationLink(destination: Symptoms()) {
                Text("CHECK")
                    .foregroundColor(.red)
                    .bold()
            }
            .simultaneousGesture(TapGesture().onEnded{
                steps.stepList.append(causes[selectedCause])
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ReviewCase_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCase().environmentObject(Steps())
    }
}
