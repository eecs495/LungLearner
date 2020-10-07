//
//  UserData.swift
//  LungLearner
//
//  Created by Nick Ceccio on 10/5/20.
//

import Foundation
import SQLite

func prepareUserDatabase() {
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    let db = try! Connection("\(path)/userdb.sqlite3")
    let userInfo = Table("userInfo")
    
    //The id of the completed case
    let id = Expression<Int64>("id")
    //When the case was completed in unix time
    let time = Expression<Int64>("time")
    //The diagnoses made by the user, comma separated, last diagnosis is the final diagnosis
    let diagnoses = Expression<String>("diagnoses")
    //User-supplied reasoning
    let reason = Expression<String>("reason")
    //Whether the user got it right
    let correct = Expression<Bool>("correct")
    
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
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    let db = try! Connection("\(path)/userdb.sqlite3")
    let userInfo = Table("userInfo")
    let correct = Expression<Bool>("correct")
    
    let totalCases = try! db.scalar(userInfo.count)
    let correctCases = try! db.scalar(userInfo.filter(correct == true).count)
    let incorrectCases = try! db.scalar(userInfo.filter(correct == false).count)
    
    return (totalCases, correctCases, incorrectCases)
}

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

func storeCaseResult(result: UserCaseResult) {
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    let db = try! Connection("\(path)/userdb.sqlite3")
    let userInfo = Table("userInfo")
    
    let id = Expression<Int64>("id")
    let time = Expression<Int64>("time")
    let diagnoses = Expression<String>("diagnoses")
    let reason = Expression<String>("reason")
    let correct = Expression<Bool>("correct")
    
    let insert = userInfo.insert(id <- result.caseid,
        time <- Int64(Date().timeIntervalSince1970),
        diagnoses <- result.diagnoses.joined(separator: ","),
        reason <- result.reason,
        correct <- result.correct)
    try! db.run(insert)
}
