//
//  ReviewCase.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/9/20.
//

import SwiftUI

struct ReviewCase: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Your Diagnostic Process")
                .bold()
                .padding(.bottom, 2)
            ForEach(steps.stepList, id: \.self) { step in
                Text(step)
                    .font(.body)
                    .foregroundColor(.accentColor)
            }
            Picker(selection: $selectedCause, label: Text("Please choose a color")) {
                ForEach(0 ..< causes.count) {
                    Text(causes[$0])
                }
            }
        }
//        NavigationView {
//            VStack(alignment: .center) {
//                Button(action: {
//                    print("Delete button tapped!")
//                }) {
//                    Text("DIAGNOSE")
//                        .bold()
//                }
//                Text(steps.History)
//                Text(steps.Symptoms)
//                Text(steps.PhysicalExam)
//                List {
//                    NavigationLink(destination: History(canGoBack: true)) {
//                        Text("History")
//                    }
//                    NavigationLink(destination: Symptoms()) {
//                        Text("Symptoms")
//                    }
//                    NavigationLink(destination: PhysicalExam()) {
//                        Text("PhysicalExam")
//                    }
//                    NavigationLink(destination: LabValues()) {
//                        Text("Lab Values")
//                    }
//                    NavigationLink(destination: ArterialBloodGas()) {
//                        Text("Arterial Blood Gas")
//                    }
//                    NavigationLink(destination: XRay()) {
//                        Text("X-Ray")
//                    }
//                }
//            }
//        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ReviewCase_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCase().environmentObject(Steps())
    }
}
