//
//  LungLearnerApp.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import SwiftUI
import GoogleSignIn

class LoginManager {
    var userid: String
    static let shared = LoginManager(id: "")
    private init(id: String) {
        self.userid = id
    }
    
    func setId(id: String) {
        self.userid = id
    }
    
    func getId() -> String {
        return self.userid
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
          if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
            print("The user has not signed in before or they have since signed out.")
          } else {
            print("\(error.localizedDescription)")
          }
          return
        }
        // Perform any operations on signed in user here.
        LoginManager.shared.setId(id: user.profile.email)
    }
    
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
        
        GIDSignIn.sharedInstance().clientID = "90255751140-l41hhvd6fg70dp88qhf0067066molabv.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
      // Perform any operations when the user disconnects from app here.
      // ...
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
