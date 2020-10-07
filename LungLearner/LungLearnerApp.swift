//
//  LungLearnerApp.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        prepareUserDatabase()
        // Currently here to test printing all the cases
        let caseDbManager = CaseDatabaseManager()
        caseDbManager.getAllCases()
        return true
    }
}

@main
struct LungLearnerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NewCase()
        }
    }
}
