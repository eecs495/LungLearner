//
//  CaseDatabaseManager.swift
//  LungLearner
//
//  Created by Robert Aung on 10/6/20.
//

import Foundation
import SQLite

struct NewCaseData: Identifiable {
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

enum CaseError: Error {
    case runtimeError(String)
}

class CaseDatabaseManager {
    var db:Connection

    // Initialize the db connection upon class creation
    init() {
        let path = Bundle.main.path(forResource: "CaseDb", ofType: "sqlite3")!
        self.db = try! Connection(path, readonly: true)
    }

    // Instance method used to print all cases
    func getAllCases() {
        let cases = Table("cases")
        // Same as SELECT * from "cases"
        for caseInfo in try! self.db.prepare(cases) {
            printCase(caseInfo:caseInfo)
        }
    }

    // Getting a case by ID
    func getCaseById(Id: Int64) throws -> NewCaseData {
        let cases = Table("cases")
        let ID = Expression<Int64>("ID")

        let filtered = try! self.db.prepare(cases.filter(ID == Id))

        for caseInfo in filtered {
            return makeCase(caseInfo:caseInfo)
        }
        throw(CaseError.runtimeError("Case with ID \(Id) not found"))
    }

    // Static method just for testing
    static func connectAndPrintCases() {
        // Establish a read-only connection to the database since it is added as
        // part of the app bundle
        let path = Bundle.main.path(forResource: "testdb", ofType: "sqlite3")!
        print("Path " + path)
        let db = try! Connection(path, readonly: true)
        let cases = Table("cases")
    
        // Same as SELECT * from "cases"
        for caseInfo in try! db.prepare(cases) {
            printCase(caseInfo:caseInfo)
        }
    }
}

// Utility method used to convert to NewCaseData type
func makeCase(caseInfo: Row) -> NewCaseData {
    let ID = Expression<Int64>("ID")
    let CorrectDiagnosis = Expression<String>("CorrectDiagnosis")
    let Persona = Expression<String>("Persona")
    let Temperature = Expression<Double>("Temperature")
    let HeartRate = Expression<Double>("HeartRate")
    let RespiratoryRate = Expression<Double?>("RespiratoryRate")
    let BloodPressure = Expression<String>("Bloodpressure")
    let OxygenSaturation = Expression<String>("Oxygensaturation")
    let General = Expression<String>("General")
    let Cardiovascular = Expression<String>("Cardiovascular")
    let Chest = Expression<String>("Chest")
    let BloodGas = Expression<String>("bloodgas")
    
    let exam = Exam(general:caseInfo[General],cardiovascular:caseInfo[Cardiovascular], chest: caseInfo[Chest])
    let symptom = Symptom(temperature:caseInfo[Temperature], heartRate:caseInfo[HeartRate], respiratoryRate:caseInfo[RespiratoryRate] ?? 0.0, bloodPressure:caseInfo[BloodPressure], oxygenSaturation:caseInfo[OxygenSaturation])
    let caseData = NewCaseData(id:Int(caseInfo[ID]), history:caseInfo[Persona], correctDiagnosis:caseInfo[CorrectDiagnosis], symptoms:symptom, exam:exam, bloodGas:caseInfo[BloodGas])
    return caseData
}

// Utility method to print case for debugging purposes
func printCase(caseInfo: Row) {
    let caseInfo = makeCase(caseInfo:caseInfo)
    print("DEBUG: PRINTING CASE")
    print(caseInfo)
}
