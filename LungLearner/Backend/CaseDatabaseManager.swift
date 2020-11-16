//
//  CaseDatabaseManager.swift
//  LungLearner
//
//  Created by Robert Aung on 10/6/20.
//

import Foundation
import SQLite

class CaseDatabaseManager {
    static let shared = CaseDatabaseManager()
    
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
    func getCaseById(Id: Int64) throws -> CaseData {
        let cases = Table("cases")
        let ID = Expression<Int64>("ID")

        let filtered = try! self.db.prepare(cases.filter(ID == Id))

        for caseInfo in filtered {
            return makeCase(caseInfo:caseInfo)
        }
        throw(CaseError.runtimeError("Case with ID \(Id) not found"))
    }

    // Get a random case
    func getRandomCase() throws -> CaseData {
        let cases = Table("cases")
        let numCases = try db.scalar(cases.count)

        let randomId = Int64(Int.random(in: 0..<numCases))
        let ID = Expression<Int64>("ID")

        let filtered = try! self.db.prepare(cases.filter(ID == randomId))

        for caseInfo in filtered {
            return makeCase(caseInfo:caseInfo)
        }
        throw(CaseError.runtimeError("Random ID generation malfunctioned"))
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
