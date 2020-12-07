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

    // Get total case count
    func getTotalCaseCount() -> Int {
        let cases = Table("cases")
        return try! db.scalar(cases.count)
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

    // Get a random case (Has to be incomplete)
    func getRandomCase() throws -> CaseData {
        let cases = Table("cases")
        let numCases = try db.scalar(cases.count)
        let doneCaseIds = UserDatabaseManager.shared.getListOfCompletedCaseIds()
        var found = false
        var randomId = Int64(0)

        // Find a random Id of case that is not completed yet
        while !found {
            randomId = Int64(Int.random(in: 0..<numCases))
            if !doneCaseIds.contains(randomId) {
                found = true
            }
        }

        // Get a random id
        do {
            return try self.getCaseById(Id: randomId)
        } catch {
            throw(CaseError.runtimeError("Random getter malfunctioned"))
        }
    }

    // Get a random case by difficulty specified (Has to be incomplete)
    func getRandomCaseByDifficulty(difficulty: Difficulty) throws -> CaseData {
        let selectedDifficulty = difficulty.rawValue
        let cases = Table("cases")
        let caseDifficulty = Expression<String>("Difficulty")

        // Get Case Ids with the difficulty
        let filteredCases = try! self.db.prepare(cases.filter(caseDifficulty == selectedDifficulty))
        var filteredCaseIds:[Int64] = []
        let ID = Expression<Int64>("ID")
        for caseInfo in filteredCases {
            filteredCaseIds.append(caseInfo[ID])
        }

        // Get new incomplete cases among filtered cases
        let doneCaseIds = UserDatabaseManager.shared.getListOfCompletedCaseIds()
        var newFilteredCaseIds:[Int64] = []
        newFilteredCaseIds = Array(Set(filteredCaseIds).subtracting(doneCaseIds))
        print("filtered", filteredCaseIds)
        print("done cases", doneCaseIds)
        print("new filtered", newFilteredCaseIds)

        // Get a random id
        do {
            if newFilteredCaseIds.isEmpty { throw(CaseError.runtimeError("No more incomplete cases")) }
            let randomId = newFilteredCaseIds.randomElement()!
            return try self.getCaseById(Id: randomId)
        } catch {
            throw(CaseError.runtimeError("Random getter malfunctioned"))
        }
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
