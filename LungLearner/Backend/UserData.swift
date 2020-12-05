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

// Struct of Usercase when returned by getID, getagegroup, getgendergroup
struct returnedUserCaseResult {
    //The id of the case that has been completed
    var caseid: Int64
    //Array of the various diagnoses the user made. The last diagnosis is considered the 'final' diagnosis for determining correctness
    var diagnoses: String
    //The user-supplied reason for their diagnosis
    var reason: String
    //Whether or not the user got this case right
    var correct: Bool
}

enum UserDataError: Error {
    case caseNotFound
}

class UserDatabaseManager {
    static let shared = UserDatabaseManager()
    
    var db:Connection
    var userInfo = Table("userInfo")
    
    
    // The id of the completed case
    var id = Expression<Int64>("id")
    // When the case was completed in unix time
    var time = Expression<Int64>("time")
    // The diagnoses made by the user, comma separated, last diagnosis is the final diagnosis
    var diagnoses = Expression<String>("diagnoses")
    // User-supplied reasoning
    var reason = Expression<String>("reason")
    // Whether the user got it right
    var correct = Expression<Bool>("correct")
    // Whether the user has set this as a 'favorite' case
    var favorite = Expression<Bool>("favorite")
    
    var first_date: NSDate = NSDate()
    var current_date: NSDate = NSDate()
    
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
            t.column(favorite)
        })
    }

    // deletes every row from the user database
    func clearData() throws {
        try db.run(userInfo.delete())
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
            correct <- result.correct,
            favorite <- false)
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
    
    func getListOfCompletedCaseIds() -> [Int64] {
        var results:[Int64] = []

        for caseEntry in try! db.prepare(userInfo.select(id, correct).order(id.asc)) {
            results.append(caseEntry[id])
        }
        return results
    }
    
    // Allows you to 'favorite' or 'unfavorite' any case with a given id
    func setCaseFavorite(idInput: Int64, favoriteInput: Bool) -> Bool {
        let filteredCase = userInfo.filter(id == idInput)
        if try! db.run(filteredCase.update(favorite <- favoriteInput)) != 1 {
            print("Error! Case not found!")
            return false
        }
        return true
    }
    
    // Returns an array of 'favorited' case id sorted by case id ascending
    func getFavoriteCases() -> [Int64] {
        var results:[Int64] = []
        
        let query = userInfo.select(id).filter(favorite == true).order(id.asc)
        for caseEntry in try! db.prepare(query) {
            results.append(caseEntry[id])
        }
        return results
    }
    
    // Returns whether or not thr given case is 'favorited'
    func checkCaseFavorite(idInput: Int64) throws -> Bool {
        let filteredCase = userInfo.filter(id == idInput)
        var fave:Bool
        if let caseEntry = try! db.pluck(filteredCase) {
            fave = caseEntry[favorite]
        } else {
            print("error: case not found")
            throw UserDataError.caseNotFound
        }
        return fave
    }

    // Get a Usercase by ID
    func getUserCaseById(Id: Int64) throws -> returnedUserCaseResult {
        let userInfo = Table("userInfo")
        let id = Expression<Int64>("id")

        let filtered = try! self.db.prepare(userInfo.filter(Id == id))

        for caseEntry in filtered {
            let diagnoses = Expression<String>("diagnoses")
            let reason = Expression<String>("reason")
            let correct = Expression<Bool>("correct")
            
            let usercase = returnedUserCaseResult(caseid: caseEntry[id], diagnoses:caseEntry[diagnoses], reason : caseEntry[reason],correct:caseEntry[correct])
            
            return usercase
        }
        throw(CaseError.runtimeError("Case with ID \(Id) not found"))
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
    func
    getAgeGroup()->([returnedUserCaseResult],[returnedUserCaseResult],[returnedUserCaseResult]){
        // Return lists
        var younglist:[returnedUserCaseResult] = []
        var middlelist:[returnedUserCaseResult] = []
        var oldlist:[returnedUserCaseResult] = []
        
        // Statement of variable used
        let id = Expression<Int64>("id")
        let age = Expression<Int64>("age")
        let diagnoses = Expression<String>("diagnoses")
        let reason = Expression<String>("reason")
        let correct = Expression<Bool>("correct")
        let cases = Table("cases")
        
        // Iterate over all user completed cases
        for caseEntry in try! db.prepare(userInfo) {
        
            // Create a UserCaseResult
            let usercase = returnedUserCaseResult(caseid: caseEntry[id], diagnoses:caseEntry[diagnoses], reason : caseEntry[reason],correct:caseEntry[correct])
            
            for studiedcase in try! db.prepare(cases.filter(id==caseEntry[id])) {
                
                // Append UserCaseResult to the correct group
                if studiedcase[age] < 30 {
                    younglist.append(usercase)
                }else if studiedcase[age] < 60 {
                    middlelist.append(usercase)
                }else{
                    oldlist.append(usercase)
                }
                
            }
        }
      
        return (younglist,middlelist,oldlist)
    }
    
    
    // Implement Get Gender Grouped Cases
    func getGenderGroup()->([returnedUserCaseResult],[returnedUserCaseResult]){
        // Return lists
        var malelist:[returnedUserCaseResult] = []
        var femalelist:[returnedUserCaseResult] = []
       
        // Variable for Case
        let id = Expression<Int64>("id")
        let gender = Expression<String>("gender")
        
        // Variable for usercase
        let diagnoses = Expression<String>("diagnoses")
        let reason = Expression<String>("reason")
        let correct = Expression<Bool>("correct")
        _ = Expression<UserCaseResult>("usercase")
        let cases = Table("cases")
    
        
        // Iterate over all user completed cases
        for caseEntry in try! db.prepare(userInfo.select(id)) {

            // Create a UserCaseResult
            let usercase = returnedUserCaseResult(caseid: caseEntry[id], diagnoses:caseEntry[diagnoses], reason : caseEntry[reason],correct:caseEntry[correct])
            
            for studiedcase in try! db.prepare(cases.filter(id==caseEntry[id])) {
                
                if studiedcase[gender] == "male" {
                    malelist.append(usercase)
                }else{
                    femalelist.append(usercase)
                }
                
            }
           
        }
      
        return (malelist,femalelist)
    }
    
    func getStreak() -> Int{
        let time_sec = current_date.timeIntervalSince(first_date as Date)
        return (Int(time_sec / 86400))

    }

    func updateStreak(){
        let now = NSDate()
        if now.timeIntervalSince(current_date as Date) < 86400 {
            current_date = now
        }else{
            first_date = now
            current_date = now
        }
    }

}

// Because unix time is weird(tm), I added this function so we can work with it a bit easier
func convertUnixTime(unixtime: Int64) -> (year: Int, month: Int, day: Int) {
    let interval = TimeInterval(unixtime)
    let date = Date(timeIntervalSince1970: interval)
    let calendar = Calendar.current
    return (calendar.component(.year, from: date), calendar.component(.month, from: date), calendar.component(.day, from: date))
}


