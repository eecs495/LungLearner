//
//  CaseData.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import Foundation
import SQLite

struct CaseData: Identifiable {
    var id: Int
    var history: String
    var correctDiagnosis: String
    var symptoms: Symptom
    var exam: Exam
    var labValuesName: String { return "labValues\(id)" }
    var bloodGas: String
    var xRayName: String { return "xRay\(id)" }
}

struct Symptom {
    var temperature: Double
    var heartRate: Double
    var respiratoryRate: Double
    var bloodPressure: String
    var oxygenSaturation: String
}

struct Exam {
    var general: String
    var cardiovascular: String
    var chest: String
}

// Error Type for CaseData related Errors
enum CaseError: Error {
    case runtimeError(String)
}


// Utility method used to convert to CaseData type
func makeCase(caseInfo: Row) -> CaseData {
    let ID = Expression<Int64>("ID")
    let CorrectDiagnosis = Expression<String>("CorrectDiagnosis")
    let Persona = Expression<String>("History")
    let Temperature = Expression<Double>("Temperature")
    let HeartRate = Expression<Double>("HeartRate")
    let RespiratoryRate = Expression<Double?>("RespiratoryRate")
    let BloodPressure = Expression<String>("BloodPressure")
    let OxygenSaturation = Expression<String>("OxygenSaturation")
    let General = Expression<String>("General")
    let Cardiovascular = Expression<String>("Cardiovascular")
    let Chest = Expression<String>("Chest")
    let BloodGas = Expression<String>("Bloodgas")

    let exam = Exam(general:caseInfo[General],cardiovascular:caseInfo[Cardiovascular], chest: caseInfo[Chest])
    let symptom = Symptom(temperature:caseInfo[Temperature], heartRate:caseInfo[HeartRate], respiratoryRate:caseInfo[RespiratoryRate] ?? 23.0, bloodPressure:caseInfo[BloodPressure], oxygenSaturation:caseInfo[OxygenSaturation])
    let caseData = CaseData(id:Int(caseInfo[ID]), history:caseInfo[Persona], correctDiagnosis:caseInfo[CorrectDiagnosis], symptoms:symptom, exam:exam, bloodGas:caseInfo[BloodGas])
    return caseData
}

// Utility method to print case for debugging purposes
func printCase(caseInfo: Row) {
    let caseInfo = makeCase(caseInfo:caseInfo)
    print("DEBUG: PRINTING CASE")
    print(caseInfo)
}

// Utility method to get a dummy case in case there is an error
func getDummyCase() -> CaseData {
    let exam = Exam(general:"Awake, alert, fully oriented",
                    cardiovascular:"Regular rate and rhythm, no murmurs",
                    chest: "Rales bilaterally")
    let symptom = Symptom(temperature:37.9, heartRate:92.0, respiratoryRate:26.0, bloodPressure:"80/47", oxygenSaturation:"92% on 6 liters per minute of supplemental oxygen")
    let caseData = CaseData(id:0, history:"You are seeing a 75-year-old White male with pneumonia. Over the past six days, he has had increasing shortness of breath, fevers, and myalgias.", correctDiagnosis:"CHF", symptoms:symptom, exam:exam, bloodGas:"pH 7.35, pCO2 39, pO2 71 on 6 L/minute of O2")
    return caseData
}
