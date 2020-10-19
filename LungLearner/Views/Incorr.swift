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
    
    var drewClass = DiagnosticProcess(cause: "being too cool", myProcess: processes)
    
    var body: some View {
        VStack {
            VStack {
                Text("Correct!")
                Text("Cause of Respiratory Failure: ")
                Text(drewClass.cause)
            }
            
            VStack(alignment: .leading) {
                Text("Your diagnostic process: ")
                    .padding(4)
                VStack(alignment: .leading) {
//                    ForEach(drewClass.myProcess) { process in
//                        VStack {
//                            DiagnoseRow(process: process)
//                        }
//                        .padding(.top, 5)
//                    }
                    
                    // ------- KEEP THIS -------
//                    VStack(alignment: .leading) {
//                        ForEach((0...4), id: \.self) {
//                            Text("\(steps.stepList[$0]) after \(causeNames[$0])")
//                                .font(.body)
//                                .foregroundColor(.secondary)
//                            }
//                    }
                    // -------------------------
                }
                .border(Color.black, width: 1)
            }
            
            VStack {
                
                NavigationLink(destination: MainMenu()) {
                    Text("click here to go home")
                    Image(systemName: "home")
//                        .font(.largeTitle)
//                        .foregroundColor(Color.black)
//                        .padding()
//                        .padding(.bottom, 30)
                }
            }
            
        }
        
        
    }
}

//struct DiagnoseRow_Previews: PreviewProvider {
//    static var previews: some View {
//        DiagnoseRow(process: processes[2[])
//    }
//}

struct Incorr_Previews: PreviewProvider {
    static var previews: some View {
        Incorr(caseData: testCaseData)
    }
}
