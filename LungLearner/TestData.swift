//
//  TestData.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/11/20.
//

import Foundation

let testSymptom = Symptom(temperature: 49.5, heartRate: 49.5, respiratoryRate: 49.5, bloodPressure: "Test BP", oxygenSaturation: "Test OS")
let testExam = Exam(general: "Test General", cardiovascular: "Test CV", chest: "Test Chest")
let testCaseData = CaseData(id: 495, history: "Test History", correctDiagnosis: "COPD", symptoms: testSymptom, exam: testExam, bloodGas: "Test BG")
