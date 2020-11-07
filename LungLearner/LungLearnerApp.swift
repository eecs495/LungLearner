//
//  LungLearnerApp.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        let userDbManager = UserDatabaseManager()
        userDbManager.prepareUserDatabase()
        // Currently here to test retrieving case info by id
        let caseDbManager = CaseDatabaseManager()
        do {
            let caseInfo = try caseDbManager.getRandomCase()
            print(caseInfo)
        } catch CaseError.runtimeError(let errorMessage) {
            print(errorMessage)
        } catch {
            print("Other errors")
        }
        
        // Amplify stuff on startup
        configureAmplify()
        saveUserPoint()
        queryUserPoint()
        
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
