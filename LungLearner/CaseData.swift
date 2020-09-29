//
//  CaseData.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import Foundation

struct CaseData: Identifiable {
    var id: Int
    var persona: String
    var symptoms: String
    var exam: [String]
    var labValuesName: String { return "labValues\(id)" }
    var bloodGas: String
    var xRayName: String { return "xRay\(id)" }
}

let testData = [
    CaseData(id: 0,
         persona: "You are seeing a 25 year-old female with pneumonia. She is slightly confused. You obtain a history from her husband. He reports that she has had four days of fevers and cough. Today, she is sleepier than usual.",
         symptoms:
            "Temperature: 39.1 C\n" +
            "Heart rate: 92\n" +
            "Respiratory rate: 28\n" +
            "Blood pressure: 94/64\n" +
            "Oxygen saturation: 96% on 4 liters per minute of supplemental oxygen",
         exam: [
            "General: Lethargic but awakens to voice, alert, fully oriented",
            "Cardiovascular: Regular rate and rhythm, no murmurs",
            "Chest: Rales noted bilaterally"
         ],
         bloodGas: "pH 7.36, pCO2 44, pO2 86 on 4 L/minute of O2")
]

