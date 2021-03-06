//
//  TestData.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/11/20.
//

import Foundation


let testSymptomData = SymptomData(onsetSymptoms: "onsetSymptoms", provocatingFactors: "provocatingFactors", descriptionSymptoms: "descriptionSymptoms")

let testSymptomValuesData = SymptomValuesData(temperature: 38.4, heartRate: 38.4, respiratoryRate: 24.0, bloodPressure: "104/53", oxygenSaturation: "91%", amountOfOxygenReceived: "4 liters per minute")

let testPhysicalExamData = PhysicalExamData(general: "awake, alert, oriented x 2", head: "pupils equal and reactive, dry mucous membranes", neck: "No jugular venous distention", heart: "tachycardic, regular rhythm", lungs: "Crackles in the right lung", abdomen: "soft, nontender, nondistended", extremities: "no edema", skin: "warm, dry")

let testLabExamData = LabExamData(whiteBloodCells: 14.2, hemoglobin: 13.6, hematocrit: 40.1, platelets: 247.0, sodium: 137.0, potassium: 4.2, chloride: 104.0, bicarbonate: 21.0, bun: 24.0, creatinine: 1.6, glucose: 137.0, bnp: 37.0, abgPh: 7.35, abgPCo2: 39.0, abgPO2: 71.0, lactate: 2.4)

let testCaseData1 = CaseData(id: 1, caseId: 201, correctDiagnosis: "COPD", age: 74, gender: "male", history1: "heart failure", history2: "coronary artery disease", history3: "COPD", tobaccoUse: "current", symptomData: testSymptomData, symptomValuesData: testSymptomValuesData, physicalExamData: testPhysicalExamData, labExamData: testLabExamData, expertComments: "expert comments", redHerrings: "red herrings", cxrThoughts: "cxr thoughts", narratives: "narratives", difficulty: "medium")

let testCaseData2 = CaseData(id: 2, caseId: 202, correctDiagnosis: "COPD", age: 74, gender: "female", history1: "heart failure", history2: "coronary artery disease", history3: "COPD", tobaccoUse: "current", symptomData: testSymptomData, symptomValuesData: testSymptomValuesData, physicalExamData: testPhysicalExamData, labExamData: testLabExamData, expertComments: "expert comments", redHerrings: "red herrings", cxrThoughts: "cxr thoughts", narratives: "narratives", difficulty: "medium")

let testCaseData3 = CaseData(id: 3, caseId: 203, correctDiagnosis: "CHF", age: 23, gender: "male", history1: "heart failure", history2: "coronary artery disease", history3: "COPD", tobaccoUse: "current", symptomData: testSymptomData, symptomValuesData: testSymptomValuesData, physicalExamData: testPhysicalExamData, labExamData: testLabExamData, expertComments: "expert comments", redHerrings: "red herrings", cxrThoughts: "cxr thoughts", narratives: "narratives", difficulty: "medium")


let testCaseData4 = CaseData(id: 4, caseId: 204, correctDiagnosis: "CHF", age: 23, gender: "female", history1: "heart failure", history2: "coronary artery disease", history3: "COPD", tobaccoUse: "current", symptomData: testSymptomData, symptomValuesData: testSymptomValuesData, physicalExamData: testPhysicalExamData, labExamData: testLabExamData, expertComments: "expert comments", redHerrings: "red herrings", cxrThoughts: "cxr thoughts", narratives: "narratives", difficulty: "medium")


let testCaseData5 = CaseData(id: 5, caseId: 205, correctDiagnosis: "Pneumonia", age: 50, gender: "male", history1: "heart failure", history2: "coronary artery disease", history3: "COPD", tobaccoUse: "current", symptomData: testSymptomData, symptomValuesData: testSymptomValuesData, physicalExamData: testPhysicalExamData, labExamData: testLabExamData, expertComments: "expert comments", redHerrings: "red herrings", cxrThoughts: "cxr thoughts", narratives: "narratives", difficulty: "medium")

let testCaseData = CaseData(id: 5, caseId: 205, correctDiagnosis: "Pneumonia", age: 74, gender: "male", history1: "heart failure", history2: "coronary artery disease", history3: "COPD", tobaccoUse: "current", symptomData: testSymptomData, symptomValuesData: testSymptomValuesData, physicalExamData: testPhysicalExamData, labExamData: testLabExamData, expertComments: "expert comments", redHerrings: "red herrings", cxrThoughts: "cxr thoughts", narratives: "narratives", difficulty: "medium")


let testXRayName = "xRay1"

struct MockCaseDataForReview: Identifiable {
    
    var id: Int
    var caseData: CaseData
    var correct: Correctness
    
    enum Correctness: String, CaseIterable,Codable,Hashable {
        case Correct = "Correct"
        case Incorrect = "Incorrect"
    }
}

let testCorrectCaseDataList = [ testCaseData1,
                                testCaseData2,
                                testCaseData3 ]

let testIncorrectCaseDataList = [ testCaseData4,
                                  testCaseData5 ]

struct FranksCaseData: Hashable,Codable, Identifiable{
    var id:Int
    var correct:Correctness
    var history1: String
    var XrayName:String
    
    enum Correctness: String, CaseIterable,Codable,Hashable {
        case Correct = "Correct"
        case Incorrect = "Incorrect"
        
    }
}

let testStepsList: [String] = ["HISTORY", "SYMPTOMS", "PHYSICAL EXAM", "LAB VALUES", "X-RAY", "FINAL"]
