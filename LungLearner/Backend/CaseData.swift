//
//  CaseData.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import Foundation
import SQLite

struct CaseData: Identifiable {
    var id: Int
    var persona: String
    var symptoms: String
    var exam: [String]
    var labValuesName: String { return "labValues\(id)" }
    var bloodGas: String
    var xRayName: String { return "xRay\(id)" }
}



let testData = [
    CaseData(id: 0,
         persona: "You are seeing a 25 year-old female with pneumonia. She is slightly confused. You obtain a history from her husband. He reports that she has had four days of fevers and cough. Today, she is sleepier than usual.",
         symptoms:
            "Temperature: 39.1 C\n" +
            "Heart rate: 92\n" +
            "Respiratory rate: 28\n" +
            "Blood pressure: 94/64\n" +
            "Oxygen saturation: 96% on 4 liters per minute of supplemental oxygen",
         exam: [
            "General: Lethargic but awakens to voice, alert, fully oriented",
            "Cardiovascular: Regular rate and rhythm, no murmurs",
            "Chest: Rales noted bilaterally"
         ],
         bloodGas: "pH 7.36, pCO2 44, pO2 86 on 4 L/minute of O2")
]

func prepareCaseDatabase() {
    //Only run this function as a part of development to produce the database for cases
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    //using this path, you can move the db file to the project folder and prepackage it with the app
    print(path)
    let db = try! Connection("\(path)/db.sqlite3")
    //once you have moved the database, you can access it using
    //let path = Bundle.main.path(forResource: "db", ofType: "sqlite3")!
    //let db = try! Connection(path, readonly: false)
    let cases = Table("cases")
    let id = Expression<Int64>("id")
    let correctDiagnosis = Expression<String>("correctDiagnosis")
    let persona = Expression<String>("persona")
    let temperature = Expression<Double?>("temperature")
    let heartrate = Expression<Int?>("heartrate")
    let resprate = Expression<Int?>("resprate")
    let bloodPressure = Expression<String?>("bloodPressure")
    let oxSaturation = Expression<String?>("oxSaturation")
    let generalExam = Expression<String?>("generalExam")
    let cardioExam = Expression<String?>("cardioExam")
    let chestExam = Expression<String?>("chestExam")
    let bloodGas = Expression<String?>("bloodGas")
    try! db.run(cases.create { t in
        t.column(id, primaryKey: true)
        t.column(correctDiagnosis)
        t.column(persona)
        t.column(temperature)
        t.column(heartrate)
        t.column(resprate)
        t.column(bloodPressure)
        t.column(oxSaturation)
        t.column(generalExam)
        t.column(cardioExam)
        t.column(chestExam)
        t.column(bloodGas)
    })
    let insert = cases.insert(id <- 0,
                //I have no idea if this is true
                correctDiagnosis <- "CHF",
                persona <- "You are seeing a 25 year-old female with pneumonia. She is slightly confused. You obtain a history from her husband. He reports that she has had four days of fevers and cough. Today, she is sleepier than usual.",
                temperature <- 39.1,
                heartrate <- 92,
                resprate <- 28,
                bloodPressure <- "94/64",
                oxSaturation <- "96% on 4 liters per minute of supplemental oxygen",
                generalExam <- "Lethargic but awakens to voice, alert, fully oriented",
                cardioExam <- "Regular rate and rhythm, no murmurs",
                chestExam <- "Rales noted bilaterally",
                bloodGas <- "pH 7.36, pCO2 44, pO2 86 on 4 L/minute of O2")
    let rowid = try! db.run(insert)
    let query = cases.select(persona)
        .filter(id == rowid)
    
    for onecase in try! db.prepare(query) {
        print("I got \(onecase[persona])!")
    }
}
