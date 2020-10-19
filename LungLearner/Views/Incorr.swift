//
//  Incorr.swift
//  LungLearner
//
//  Created by Drew Hirselj on 10/4/20.
//

import SwiftUI

struct DiagnoseRow: View {
    var process: Process
    
    var body: some View {
        HStack {
            Image(systemName: process.symbolName)
            Text(process.certainty + " after " + process.name)
        }
    }
}
struct Incorr: View {
    
    @EnvironmentObject var steps: Steps
    var caseData: CaseData
    
    // var drewClass = DiagnosticProcess(cause: "being too cool", myProcess: processes)
    
    var body: some View {
        ScrollView {
            VStack {
                Text(caseData.correctDiagnosis == steps.stepList[5] ? "Correct!" : "Incorrect")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 40)
                    .padding(.bottom)
                Text("Cause of Respiratory Failure")
                    .bold()
                    .padding(.bottom, 2)
                    .padding(.top)
                Text("\(caseData.correctDiagnosis)")
                    .font(.body)
                    .foregroundColor(.accentColor)
                Text("Your Diagnostic Process")
                    .bold()
                    .padding(.bottom, 2)
                    .padding(.top)
                VStack(alignment: .leading) {
                    ForEach((0...4), id: \.self) {
                        Text("\(steps.stepList[$0]) after \(causeNames[$0])")
                            .font(.body)
                            .foregroundColor(.secondary)
                        }
                }
                Text("Final Diagnosis")
                    .bold()
                    .padding(.bottom, 2)
                    .padding(.top)
                Text("\(steps.stepList[5])")
                    .font(.body)
                    .foregroundColor(.accentColor)
                NavigationLink(destination: MainMenu()) {
                    Image(systemName: "house.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                        .padding()
                        .padding(.vertical)
                }
                .padding(.bottom, 30)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}

//struct DiagnoseRow_Previews: PreviewProvider {
//    static var previews: some View {
//        DiagnoseRow(process: processes[2[])
//    }
//}

struct Incorr_Previews: PreviewProvider {
    static var previews: some View {
        Incorr(caseData: testCaseData1)
    }
}
