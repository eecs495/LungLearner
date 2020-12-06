//
//  emailProfesslr.swift
//  LungLearner
//
//  Created by 郑静楠 on 12/1/20.
//

import Foundation
import SQLite

func emailProfessor(emailofProfessor: String, emailofUser: String, caseInfo: String) -> () {
    let email = "foo@bar.com"
    if let url = URL(string: "mailto:\(email)") {
        Link("Learn SwiftUI", destination: url!)
    }
}
