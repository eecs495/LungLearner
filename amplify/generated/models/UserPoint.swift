// swiftlint:disable all
import Amplify
import Foundation

public struct UserPoint: Model {
  public let id: String
  public var username: String
  public var points: Int
  
  public init(id: String = UUID().uuidString,
      username: String,
      points: Int) {
      self.id = id
      self.username = username
      self.points = points
  }
}