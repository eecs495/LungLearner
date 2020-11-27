//
//  LoginViewController.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/26/20.
//

import SwiftUI
import UIKit
import GoogleSignIn


struct LoginViewController: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> UIViewController {
        let loginViewController = UIViewController()
        GIDSignIn.sharedInstance()?.presentingViewController = loginViewController
        return loginViewController
    }
    
    func updateUIViewController(_ pageViewController: UIViewController, context: Context) {}
}
