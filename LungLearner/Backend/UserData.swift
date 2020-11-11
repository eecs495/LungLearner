//
//  UserData.swift
//  LungLearner
//
//  Created by Nick Ceccio on 10/5/20.
//

import Foundation
import SQLite

struct UserCaseResult {
    //The id of the case that has been completed
    var caseid: Int64
    //Array of the various diagnoses the user made. The last diagnosis is considered the 'final' diagnosis for determining correctness
    var diagnoses: [String]
    //The user-supplied reason for their diagnosis
    var reason: String
    //Whether or not the user got this case right
    var correct: Bool
}

class UserDatabaseManager {
    var db:Connection
    var userInfo = Table("userInfo")
    
    //The id of the completed case
    var id = Expression<Int64>("id")
    //When the case was completed in unix time
    var time = Expression<Int64>("time")
    //The diagnoses made by the user, comma separated, last diagnosis is the final diagnosis
    var diagnoses = Expression<String>("diagnoses")
    //User-supplied reasoning
    var reason = Expression<String>("reason")
    //Whether the user got it right
    var correct = Expression<Bool>("correct")

    init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!
        db = try! Connection("\(path)/userdb.sqlite3")
    }
    func prepareUserDatabase() {
        try! db.run(userInfo.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(time)
            t.column(diagnoses)
            t.column(reason)
            t.column(correct)
        })
    }

    //Returns how many cases the user completed, how many they got right, and how many they got wrong
    func getTotalUserProgress() -> (totalCases: Int, correctCases: Int, incorrectCases: Int) {
        
        let totalCases = try! db.scalar(userInfo.count)
        let correctCases = try! db.scalar(userInfo.filter(correct == true).count)
        let incorrectCases = try! db.scalar(userInfo.filter(correct == false).count)
        
        return (totalCases, correctCases, incorrectCases)
    }

    func storeCaseResult(result: UserCaseResult) {
        
        let insert = userInfo.insert(id <- result.caseid,
            time <- Int64(Date().timeIntervalSince1970),
            diagnoses <- result.diagnoses.joined(separator: ","),
            reason <- result.reason,
            correct <- result.correct)
        try! db.run(insert)
    }

    // Implement which cases right/wrong getter
    // check all completed cases and return a list of case IDs paired with booleans marking whether the
    // user diagnosed the case right of ir they diagnosed the case wrong
    func getListOfCompletedCases() -> [(id: Int64, correct: Bool)] {
        var results:[(id: Int64, correct: Bool)] = []
        
        for caseEntry in try! db.prepare(userInfo.select(id, correct).order(id.asc)) {
            results.append((id: caseEntry[id], correct: caseEntry[correct]))
        }
        print(results)
        return results
    }


    // Implement user explanation/diagnosis getter
    // take in a case ID and return the diagnosis and explanation the user gave for that case
    func getUserDiagnosis(idInput: Int64) -> (diagnoses: String, reason: String){
        var results:(diagnoses: String, reason: String)? = nil
        for caseEntry in try! db.prepare(userInfo.select(diagnoses, reason).filter(id==idInput)) {
            results = (diagnoses: caseEntry[diagnoses], reason: caseEntry[reason])
        }
        print(results ?? ("Not valid","Not valid"))
        return results ?? ("Not valid", "Not valid")
    }
    
    // Implement Get Age Grouped Cases
    func getAgeGroup()->([young:UserCaseResult],[middle:UserCaseResult],[old:UserCaseResult]){
        
        // Return lists
        var younglist:[young:UserCaseResult] = []
        var middlelist:[middle:UserCaseResult] = []
        var oldlist:[old:UserCaseResult] = []
        
        // Statement of variable used
        var id = Expression<Int64>("id")
        var Age = Expression<Int64>("Age")
        var CaseData = Expression<CaseData>("CaseData")
        var diagnoses = Expression<String>("diagnoses")
        var reason = Expression<String>("reason")
        var correct = Expression<Bool>("correct")
        var usercase = Expression<UserCaseResult>("usercase")
        
        // Iterate over all user completed cases
        for caseEntry in try db.prepare(userInfo.select(id)) {
            CaseData = getCaseById(caseEntry[id])
            
            // Create a UserCaseResult
            let usercase = UserCaseResult(caseid: Int(caseEntry[id]), diagnoses:caseEntry[diagnoses], reason : caseEntry[reason],correct:caseEntry[correct])
            
            // Append UserCaseResult to the correct group
            if Int(CaseData[Age]) < 30 {
                younglist.append(usercase)
            }else if Int(CaseData[Age]) < 60 {
                middlelist.append(usercase)
            }else{
                oldlist.append(usercase)
            }
        }
      
        return (younglist,middelist,oldlist)
    }
    
    
    // Implement Get Gender Grouped Cases
    func getGenderGoup()->([male:UserCaseResult],[female:UserCaseResult]){
        // Return lists
        var malelist:[male:UserCaseResult] = []
        var femalelist:[female:UserCaseResult] = []
       
        // Variable for Case
        var id = Expression<Int64>("id")
        var CaseData = Expression<CaseData>("CaseData")
        let gender = Expression<String>("gender")
        
        // Variable for usercase
        var diagnoses = Expression<String>("diagnoses")
        var reason = Expression<String>("reason")
        var correct = Expression<Bool>("correct")
        var usercase = Expression<UserCaseResult>("usercase")
        
        // Iterate over all user completed cases
        for caseEntry in try db.prepare(userInfo.select(id)) {
            CaseData = getCaseById(caseEntry[id])
            
            // Create a UserCaseResult
            let usercase = UserCaseResult(caseid: Int(caseEntry[id]), diagnoses:caseEntry[diagnoses], reason : caseEntry[reason],correct:caseEntry[correct])
            
            // Append UserCaseResult to the correct group
            if (CaseData[gender]) == "male"{
                malelist.append(usercase)
            }else{
                femalelist.append(usercase)
            }
        }
      
        return (malelist,femalelist)
    }
}

// Because unix time is weird(tm), I added this function so we can work with it a bit easier
func convertUnixTime(unixtime: Int64) -> (year: Int, month: Int, day: Int) {
    let interval = TimeInterval(unixtime)
    let date = Date(timeIntervalSince1970: interval)
    let calendar = Calendar.current
    return (calendar.component(.year, from: date), calendar.component(.month, from: date), calendar.component(.day, from: date))
}
