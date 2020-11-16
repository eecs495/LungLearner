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
    var caseId: Int
    var correctDiagnosis: String
    var age: Int
    var gender: String
    var history1: String
    var history2: String
    var history3: String
    var tobaccoUse: String
    var symptomData: SymptomData
    var symptomValuesData: SymptomValuesData
    var physicalExamData: PhysicalExamData
    var labExamData: LabExamData
    var expertComments: String
    var redHerrings: String
    var cxrThoughts: String
    var narratives: String
    var difficulty: String
    var labValuesName: String { return "labValues\(id)" }
    var xRayName: String { return "xRay\(id)" }
}

struct SymptomData {
    var onsetSymptoms: String
    var provocatingFactors: String
    var descriptionSymptoms: String
}

struct SymptomValuesData {
    var temperature: Double
    var heartRate: Double
    var respiratoryRate: Double
    var bloodPressure: String
    var oxygenSaturation: String
    var amountOfOxygenReceived: String
}

struct PhysicalExamData {
    var general: String
    var head: String
    var neck: String
    var heart: String
    var lungs: String
    var abdomen: String
    var extremities: String
    var skin: String
}

struct LabExamData {
    var whiteBloodCells: Double
    var hemoglobin: Double
    var hematocrit: Double
    var platelets: Double
    var sodium: Double
    var potassium: Double
    var chloride: Double
    var bicarbonate: Double
    var bun: Double
    var creatinine: Double
    var glucose: Double
    var bnp: Double
    var abgPh: Double
    var abgPCo2: Double
    var abgPO2: Double
    var lactate: Double
}

// Error Type for CaseData related Errors
enum CaseError: Error {
    case runtimeError(String)
}


// Utility method used to convert to CaseData type
func makeCase(caseInfo: Row) -> CaseData {
    let ID = Expression<Int64>("ID")
//    let CorrectDiagnosis = Expression<String?>("CorrectDiagnosis")
    let CaseId = Expression<Int64>("CASEID")
    let Age = Expression<Int64>("Age")
    let Gender = Expression<String>("Gender")
    let History1 = Expression<String>("History1")
    let History2 = Expression<String>("History2")
    let History3 = Expression<String>("History3")
    let TobaccoUse = Expression<String>("TobaccoUse")
    let OnsetSymptoms = Expression<String>("OnsetSymptoms")
    let ProvocatingFactors = Expression<String>("ProvocatingFactors")
    let DescriptionSymptoms = Expression<String>("DescriptionSymptoms")
    let Temperature = Expression<Double>("Temperature")
    let HeartRate = Expression<Double>("HeartRate")
    let RespiratoryRate = Expression<Double>("RespiratoryRate")
    let BloodPressure = Expression<String>("BloodPressure")
    let OxygenSaturation = Expression<String>("OxygenSaturation")
    let AmountOfOxygenReceived = Expression<String>("AmountOfOxygenReceived")
    let PhysicalExamGeneral = Expression<String>("PhysicalExamGeneral")
    let PhysicalExamHead = Expression<String>("PhysicalExamHead")
    let PhysicalExamNeck = Expression<String>("PhysicalExamNeck")
    let PhysicalExamHeart = Expression<String>("PhysicalExamHeart")
    let PhysicalExamLungs = Expression<String>("PhysicalExamLungs")
    let PhysicalExamAbdomen = Expression<String>("PhysicalExamAbdomen")
    let PhysicalExamExtremities = Expression<String>("PhysicalExamExtremities")
    let PhysicalExamSkin = Expression<String>("PhysicalExamSkin")
    let WhiteBloodCells = Expression<Double>("WhiteBloodCells")
    let Hemoglobin = Expression<Double>("Hemoglobin")
    let Hematocrit = Expression<Double>("Hematocrit")
    let Platelets = Expression<Double>("Platelets")
    let Sodium = Expression<Double>("Sodium")
    let Potassium = Expression<Double>("Potassium")
    let Chloride = Expression<Double>("Chloride")
    let Bicarbonate = Expression<Double>("Bicarbonate")
    let BUN = Expression<Double>("BUN")
    let Creatinine = Expression<Double>("Creatinine")
    let Glucose = Expression<Double>("Glucose")
    let BNP = Expression<Double>("BNP")
    let ABGPh = Expression<Double>("ABG-pH")
    let ABGpCO2 = Expression<Double>("ABG-pCO2")
    let ABGpO2 = Expression<Double>("ABG-pO2")
    let Lactate = Expression<Double>("Lactate")
    let Diagnosis = Expression<String>("Diagnosis")
    let ExpertComments = Expression<String>("Diagnosis")
    let RedHerrings = Expression<String>("Diagnosis")
    let CXRThoughts = Expression<String>("CXRThoughts")
    let Narratives = Expression<String>("Narratives")
    let Difficulty = Expression<String>("Difficulty")

    let symptom = SymptomData(onsetSymptoms: caseInfo[OnsetSymptoms], provocatingFactors: caseInfo[ProvocatingFactors], descriptionSymptoms: caseInfo[DescriptionSymptoms])

    let symptomValuesData = SymptomValuesData(temperature: caseInfo[Temperature], heartRate: caseInfo[HeartRate], respiratoryRate: caseInfo[RespiratoryRate], bloodPressure: caseInfo[BloodPressure], oxygenSaturation: caseInfo[OxygenSaturation], amountOfOxygenReceived: caseInfo[AmountOfOxygenReceived])
    
    let physicalExamData = PhysicalExamData(general: caseInfo[PhysicalExamGeneral], head: caseInfo[PhysicalExamHead], neck: caseInfo[PhysicalExamNeck], heart: caseInfo[PhysicalExamHeart], lungs: caseInfo[PhysicalExamLungs], abdomen: caseInfo[PhysicalExamAbdomen], extremities: caseInfo[PhysicalExamExtremities], skin: caseInfo[PhysicalExamSkin])
    
    let labExamData = LabExamData(whiteBloodCells: caseInfo[WhiteBloodCells], hemoglobin: caseInfo[Hemoglobin], hematocrit: caseInfo[Hematocrit], platelets: caseInfo[Platelets], sodium: caseInfo[Sodium], potassium: caseInfo[Potassium], chloride: caseInfo[Chloride], bicarbonate: caseInfo[Bicarbonate], bun: caseInfo[BUN], creatinine: caseInfo[Creatinine], glucose: caseInfo[Glucose], bnp: caseInfo[BNP], abgPh: caseInfo[ABGPh], abgPCo2: caseInfo[ABGpCO2], abgPO2: caseInfo[ABGpO2], lactate: caseInfo[Lactate])

    let caseData = CaseData(id: Int(caseInfo[ID]), caseId: Int(caseInfo[CaseId]), correctDiagnosis: caseInfo[Diagnosis], age: Int(caseInfo[Age]), gender: caseInfo[Gender], history1: caseInfo[History1], history2: caseInfo[History2], history3: caseInfo[History3], tobaccoUse: caseInfo[TobaccoUse], symptomData: symptom, symptomValuesData: symptomValuesData, physicalExamData: physicalExamData, labExamData: labExamData, expertComments: caseInfo[ExpertComments], redHerrings: caseInfo[RedHerrings], cxrThoughts: caseInfo[CXRThoughts], narratives: caseInfo[Narratives], difficulty: caseInfo[Difficulty])

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
    let symptomData = SymptomData(onsetSymptoms: "5 days", provocatingFactors: "lying flat", descriptionSymptoms: "tired and fatigued with fevers and rigors")

    let symptomValuesData = SymptomValuesData(temperature: 38.4, heartRate: 38.4, respiratoryRate: 24.0, bloodPressure: "104/53", oxygenSaturation: "91%", amountOfOxygenReceived: "4 liters per minute")

    let physicalExamData = PhysicalExamData(general: "awake, alert, oriented x 2", head: "pupils equal and reactive, dry mucous membranes", neck: "No jugular venous distention", heart: "tachycardic, regular rhythm", lungs: "Crackles in the right lung", abdomen: "soft, nontender, nondistended", extremities: "no edema", skin: "warm, dry")

    let labExamData = LabExamData(whiteBloodCells: 14.2, hemoglobin: 13.6, hematocrit: 40.1, platelets: 247.0, sodium: 137.0, potassium: 4.2, chloride: 104.0, bicarbonate: 21.0, bun: 24.0, creatinine: 1.6, glucose: 137.0, bnp: 37.0, abgPh: 7.35, abgPCo2: 39.0, abgPO2: 71.0, lactate: 2.4)

    let caseData = CaseData(id: 1, caseId: 211, correctDiagnosis: "COPD", age: 74, gender: "male", history1: "heart failure", history2: "coronary artery disease", history3: "COPD", tobaccoUse: "current", symptomData: symptomData, symptomValuesData: symptomValuesData, physicalExamData: physicalExamData, labExamData: labExamData, expertComments: "History of severe COPD with wheezing on examination, elevated pCO2 level, and CXR without infiltrates", redHerrings: "High WBC count - could be pneumonia!", cxrThoughts: "Normal lungs", narratives: "Case ID 211 is a 53-year old female presenting severe dyspnea. She has a history of polysubstance use, tobacco use, severe chronic obstructive pulmonary disease on 3-4 liters per minute of supplemental oxygen, and heart failure s/p tricuspid valve endocarditis. She was feeling fine until this morning when she woke up short of breath. She states that her oxygen fell off overnight. When EMS found her, her oxygen saturation was in the 80s on 3 LPM. She was placed on 12 LPM with improvement. She denies any worsening cough, sputum production, fevers, or chills.", difficulty: "Medium")

    return caseData
}
