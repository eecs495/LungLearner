//
//  UserPoints.swift
//  LungLearner
//
//  Created by Robert Aung on 11/6/20.
//

import Foundation

import Amplify
import AmplifyPlugins

func configureAmplify() {
    let models = AmplifyModels()
    let apiPlugin = AWSAPIPlugin(modelRegistration: models)
    let dataStorePlugin = AWSDataStorePlugin(modelRegistration: models)

    do {
        try Amplify.add(plugin: apiPlugin)
        try Amplify.add(plugin: dataStorePlugin)
        try Amplify.configure()
        print("Initialized Amplify");
    } catch {
        // simplified error handling for the tutorial
        print("Could not initialize Amplify: \(error)")
    }
}

func saveUserPoint() {
    let userPoint = UserPoint(username: "Richard Hawkins",
                              points: 55)
    Amplify.DataStore.save(userPoint) { result in
        switch(result) {
        case .success(let savedItem):
            print("Saved item: \(savedItem.username)")
        case .failure(let error):
            print("Could not save item to datastore: \(error)")
        }
    }
}

func queryUserPoint() {
    Amplify.DataStore.query(UserPoint.self) { result in
        switch(result) {
        case .success(let userPoints):
            for userPoint in userPoints {
                print("==== Todo ====")
                print("Name: \(userPoint.username)")
                print("Points: \(userPoint.points)")
            }
        case .failure(let error):
            print("Could not query DataStore: \(error)")
        }
    }
}
