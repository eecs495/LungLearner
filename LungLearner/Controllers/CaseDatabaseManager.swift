//
//  CaseDatabaseManager.swift
//  LungLearner
//
//  Created by Robert Aung on 10/6/20.
//

import Foundation
import SQLite

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
        let ID = Expression<Int64>("ID")
        let CorrectDiagnosis = Expression<String>("CorrectDiagnosis")
        let Persona = Expression<String?>("Persona")
        let Temperature = Expression<Double>("Temperature")
        let HeartRate = Expression<Double>("HeartRate")

        print("Printing all cases...")
        // Same as SELECT * from "cases"
        for caseInfo in try! self.db.prepare(cases) {
            print("""
                id: \(caseInfo[ID]), correct: \(caseInfo[CorrectDiagnosis]), Persona: \(caseInfo[Persona] ?? "NA"), Temperature: \(caseInfo[Temperature]), Heart Rate: \(caseInfo[HeartRate])
                """)
        }
    }

    // Static method just for testing
    static func connectAndPrintCases() {
        // Establish a read-only connection to the database since it is added as
        // part of the app bundle
        let path = Bundle.main.path(forResource: "testdb", ofType: "sqlite3")!
        print("Path " + path)
        let db = try! Connection(path, readonly: true)
        print(type(of:db))
    
        let cases = Table("cases")
        let ID = Expression<Int64>("ID")
        let CorrectDiagnosis = Expression<String>("CorrectDiagnosis")
        let Persona = Expression<String?>("Persona")
        let Temperature = Expression<Double>("Temperature")
        let HeartRate = Expression<Double>("HeartRate")
    
        // Same as SELECT * from "cases"
        for caseInfo in try! db.prepare(cases) {
            print("""
                id: \(caseInfo[ID]), correct: \(caseInfo[CorrectDiagnosis]), Persona: \(caseInfo[Persona] ?? "NA"), Temperature: \(caseInfo[Temperature]), Heart Rate: \(caseInfo[HeartRate])
                """)
        }
    }
}
