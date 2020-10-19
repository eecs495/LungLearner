//
//  TestData.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/11/20.
//

import Foundation


let testSymptomData = SymptomData(onsetSymptoms: "onsetSymptoms", durationSymptoms: "durationSymptoms", provocatingFactors: "provocatingFactors", descriptionSymptoms: "descriptionSymptoms", severitySymptoms: "severitySymptoms", relievingFactors: "relievingFactors")

let testSymptomValuesData = SymptomValuesData(temperature: 38.4, heartRate: 38.4, respiratoryRate: 24.0, bloodPressure: "104/53", oxygenSaturation: "91%", amountOfOxygenReceived: "4 liters per minute")

let testPhysicalExamData = PhysicalExamData(general: "awake, alert, oriented x 2", head: "pupils equal and reactive, dry mucous membranes", neck: "No jugular venous distention", heart: "tachycardic, regular rhythm", lungs: "Crackles in the right lung", abdomen: "soft, nontender, nondistended", extremities: "no edema", skin: "warm, dry")

let testLabExamData = LabExamData(whiteBloodCells: 14.2, hemoglobin: 13.6, hematocrit: 40.1, platelets: 247.0, sodium: 137.0, potassium: 4.2, chloride: 104.0, bicarbonate: 21.0, bun: 24.0, creatinine: 1.6, glucose: 137.0, bnp: 37.0, abgPh: 7.35, abgPCo2: 39.0, abgPO2: 71.0, lactate: 2.4)

let testCaseData = CaseData(id: 1, correctDiagnosis: "COPD", age: 74, gender: "male", history1: "heart failure", history2: "coronary artery disease", history3: "COPD", tobaccoUse: "current", symptomData: testSymptomData, symptomValuesData: testSymptomValuesData, physicalExamData: testPhysicalExamData, labExamData: testLabExamData)

//let testSteps = Steps(
