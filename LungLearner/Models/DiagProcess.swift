//
//  DiagProcess.swift
//  LungLearner
//
//  Created by Drew Hirselj on 10/4/20.
//

import Foundation

struct Process: Identifiable {
    var id = UUID()
    var name: String
    var certainty: String
    var symbolName: String
}

let processes: [Process] = [
    Process(name: "Persona", certainty: "unsure", symbolName: "smiley"),
    Process(name: "Symptoms", certainty: "unsure", symbolName: "smiley"),
    Process(name: "Physical Exam", certainty: "CHF", symbolName: "waveform.path.ecg"),
    Process(name: "Lab Results", certainty: "unsure", symbolName: "smiley"),
    Process(name: "Arterial Blood Gas", certainty: "CHF", symbolName: "waveform.path.ecg"),
    Process(name: "X-Ray", certainty: "CHF", symbolName: "waveform.path.ecg")
   
]

class DiagnosticProcess {
    var cause: String
    var myProcess: [Process]

    init(cause: String, myProcess: [Process]) {
        self.cause = cause
        self.myProcess = myProcess
    }
}

let causes = ["CHF", "COPD", "Pneuomnia", "Unsure"]

class Steps: ObservableObject {
    @Published var stepList: [String] = []
}
