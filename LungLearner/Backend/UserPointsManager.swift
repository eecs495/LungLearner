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

//func updateUserPoints(username: String, points: Int) {
//    // First get existing user point
//    do {
//        let userPoint = try queryUserPointsByUsername(username: username)
//    } catch  {
//        print("Some Error")
//    }
//
//}

func queryUserPointsByUsername(username: String) {
    let p = UserPoint.keys
//    let up
    Amplify.DataStore.query(UserPoint.self, where: p.username.eq(username)) { result in
        switch(result) {
        case .success(let userPoints):
            for userPoint in userPoints {
                print("==== UserPoints ====")
                print("Name: \(userPoint.username)")
                print("Points: \(userPoint.points)")
            }
        case .failure(let error):
            print("Could not query DataStore: \(error)")
        }
    }
//    return up
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
        return lhs.points > rhs.points
    }
    let firstn = Array(newArr.prefix(linenum))
    return firstn
}

