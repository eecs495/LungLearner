//
//  ArterialBloodGas.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/8/20.
//

import SwiftUI

struct ArterialBloodGas: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Arterial Blood Gas")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 40)
                    .padding(.bottom)
                Text("Example description.")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding()
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
                NavigationLink(destination: XRay()) {
                    Image(systemName: "arrow.right")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                        .padding()
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

struct ArterialBloodGas_Previews: PreviewProvider {
    static var previews: some View {
        ArterialBloodGas().environmentObject(Steps())
    }
}
