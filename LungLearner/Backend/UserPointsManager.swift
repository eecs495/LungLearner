//
//  UserPointsManager.swift
//  LungLearner
//
//  Created by Robert Aung on 11/8/20.
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

func saveUserPoint(username: String, points: Int) {
    let userPoint = UserPoint(username: username,
                              points: points)
    Amplify.DataStore.save(userPoint) { result in
        switch(result) {
        case .success(let savedItem):
            print("Saved item: \(savedItem.username)")
        case .failure(let error):
            print("Could not save item to datastore: \(error)")
        }
    }
}

// Add specified points for the username
// Case: If username does not exist, create entry for username with specified points
func addUserPointsForUsername(username: String, points: Int) {
    let p = UserPoint.keys
    // Find UserPoint object for username if it exists
    Amplify.DataStore.query(UserPoint.self, where: p.username.eq(username)) {
        switch $0 {
        case .success(let result):
            if (result.isEmpty) {
                print("Username does not exist, so Save a new UserPoint entry")
                saveUserPoint(username: username, points: points)
                return
            }
            print("UserPoint: \(result)")
            var userPoint = result[0]

            // If UserPoint with specified username exists, add points
            userPoint.points += points
            print("New UserPoint: \(userPoint)")
            Amplify.DataStore.save(userPoint) {
                switch $0 {
                    case .success:
                        print("Updated the existing userPoint")
                    case .failure(let error):
                        print("Error updating userPoint - \(error.localizedDescription)")
                    }
            }

        case .failure(let error):
            // If UserPoint with specified username does not exist,
            // Save a new UserPoints with the given points
            print("userPoint doesn't exist - \(error.localizedDescription)")
            return
        }
    }
}

// Get Points by Username
// Case: If username does not exist, return zero by default
func queryUserPointsByUsername(username: String) -> Int {
    let p = UserPoint.keys
    var up = 0
    Amplify.DataStore.query(UserPoint.self, where: p.username.eq(username)) {
        switch $0 {
        case .success(let result):
            print("UserPoint: \(result)")
            if (!result.isEmpty) {
                up = result[0].points
            }
        case .failure(let error):
            print("Error listing posts - \(error.localizedDescription)")
        }
    }
    return up
}

// query User position
func queryUserPositionByUsername(username: String) -> (Int) {
    let p = UserPoint.keys
    var UserPointList:[UserPoint] = []
//    let up
    Amplify.DataStore.query(UserPoint.self) { result in
        switch(result) {
        case .success(let userPoints):
            for userPoint in userPoints {
                UserPointList.append(userPoint)
                print("Name: \(userPoint.username)")
                print("Points: \(userPoint.points)")
            }
        case .failure(let error):
            print("Could not query DataStore: \(error)")
        }
    }
    
    let newArr = UserPointList.sorted { (lhs: UserPoint, rhs: UserPoint) -> Bool in
        // you can have additional code here
        return lhs.points > rhs.points
    }
    
    var index = 1
    for element in newArr{
        if element.username == p.username.rawValue{
            return index
        }else{
            index = index + 1
        }
    }
    // return 0 means not find that person
    return 0
//    return up
}

// query first several lines

func queryToplines(linenum: Int) -> [UserPoint] {
  
    var UserPointList:[UserPoint] = []
    Amplify.DataStore.query(UserPoint.self) { result in
        switch(result) {
        case .success(let userPoints):
            for userPoint in userPoints {
                UserPointList.append(userPoint)
                print("Name: \(userPoint.username)")
                print("Points: \(userPoint.points)")
            }
        case .failure(let error):
            print("Could not query DataStore: \(error)")
        }
    }
    
    let newArr = UserPointList.sorted { (lhs: UserPoint, rhs: UserPoint) -> Bool in
        // you can have additional code here
        return lhs.points > rhs.points
    }
    let firstn = Array(newArr.prefix(linenum))
    return firstn
}

