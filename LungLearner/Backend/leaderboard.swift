//
//  Leaderboard.swift
//  LungLearner
//
//  Created by Foo Bar on 10/28/20.
//

import Foundation
import Amplify
import AmplifyPlugins

func storeToLeaderboard(username: String, score: Int) {
    let item = LeaderboardEntry(username: username, score: score)
    Amplify.DataStore.save(item) { result in
        switch(result) {
        case .success(let savedItem):
            print("saved item")
        case .failure(let error):
            print("could not save item to datastore: \(error)")
        }
    }
}
