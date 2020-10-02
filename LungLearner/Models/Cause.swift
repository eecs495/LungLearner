//
//  Cause.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/29/20.
//

import Foundation

struct Cause: Identifiable {
    var id = UUID()
    var name: String
    var symbolName: String
}

let causes: [Cause] = [
    Cause(name: "CHF", symbolName: "bandage.fill"),
    Cause(name: "COPD", symbolName: "waveform.path.ecg"),
    Cause(name: "Pneumonia", symbolName: "staroflife.fill"),
    Cause(name: "Unsure", symbolName: "questionmark"),
]
