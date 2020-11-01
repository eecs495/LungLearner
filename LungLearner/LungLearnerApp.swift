//
//  LungLearnerApp.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import SwiftUI
import Amplify
import AmplifyPlugins

func configureAmp() {
    let dataStore = AWSDataStorePlugin(modelRegistration: AmplifyModels())
    let api = AWSAPIPlugin(modelRegistration: AmplifyModels())
    do {
        try Amplify.add(plugin: dataStore)
        try Amplify.add(plugin: api)
        try Amplify.configure()
        print("amplify init")
    } catch {
        print("amplify init failed: \(error)")
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        prepareUserDatabase()
        
        // Currently here to test retrieving case info by id
        let caseDbManager = CaseDatabaseManager()
        do {
            let caseInfo = try caseDbManager.getCaseById(Id: 1)
            print(caseInfo)
        } catch CaseError.runtimeError(let errorMessage) {
            print(errorMessage)
        } catch {
            print("Other errors")
        }
        configureAmp()
        storeToLeaderboard(username: "billy", score: 256)
        return true
    }
}

@main
struct LungLearnerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            MainMenu().environmentObject(Steps())
        }
    }
}
