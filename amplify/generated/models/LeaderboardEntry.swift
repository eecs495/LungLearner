// swiftlint:disable all
import Amplify
import Foundation

public struct LeaderboardEntry: Model {
  public let id: String
  public var username: String
  public var score: Int
  
  public init(id: String = UUID().uuidString,
      username: String,
      score: Int) {
      self.id = id
      self.username = username
      self.score = score
  }
}