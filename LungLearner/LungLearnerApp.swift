//
//  LungLearnerApp.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import SwiftUI
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    let googleDelegate = GoogleDelegate()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        let userDbManager = UserDatabaseManager()
        userDbManager.prepareUserDatabase()

        // Currently here to test retrieving random case by difficulty
        do {
            print("Getting random")
            let caseInfo = try CaseDatabaseManager.shared.getRandomCaseByDifficulty(difficulty: Difficulty.Hard)
            print(caseInfo)
        } catch CaseError.runtimeError(let errorMessage) {
            print(errorMessage)
        } catch {
            print("Other errors")
        }
        
        GIDSignIn.sharedInstance().clientID = "90255751140-l41hhvd6fg70dp88qhf0067066molabv.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = googleDelegate
        
        // Amplify stuff on startup
//        configureAmplify()
//        saveUserPoint()
//        queryUserPoint()
        
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

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Get the googleDelegate from AppDelegate
        let googleDelegate = (UIApplication.shared.delegate as! AppDelegate).googleDelegate
        // Add googleDelegate as an environment object
        let contentView = Login()
            .environmentObject(googleDelegate)
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            // Set presentingViewControll to rootViewController
            GIDSignIn.sharedInstance().presentingViewController = window.rootViewController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

class GoogleDelegate: NSObject, GIDSignInDelegate, ObservableObject {
    @Published var userId: String = ""
    @Published var signedIn: Bool = false
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        // If the previous `error` is null, then the sign-in was succesful
        print("Successful sign-in!")
        userId = user.profile.email
        signedIn = true
    }
}

@main
struct LungLearnerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainMenu()
                .environmentObject(appDelegate.googleDelegate)
                .background(LoginViewController())
            
        }
    }
}
