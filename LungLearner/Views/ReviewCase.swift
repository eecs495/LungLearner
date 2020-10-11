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
        ScrollView {
            VStack(alignment: .center) {
                Text("Thoughts so far...")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 40)
                    .padding(.bottom)
                VStack(alignment: .leading) {
                    ForEach((0...5), id: \.self) {
                        Text("\(steps.stepList[$0]) after \(causeNames[$0])")
                            .font(.body)
                            .foregroundColor(.secondary)
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
                NavigationLink(destination: EmptyView()) {
                    Text("CHECK")
                        .foregroundColor(.red)
                        .font(.headline)
                }
                .padding(.bottom, 30)
                .simultaneousGesture(TapGesture().onEnded{
                    steps.stepList.append(causes[selectedCause])
                })
            }
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
