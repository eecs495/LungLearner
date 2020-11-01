// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "b0b8119128fa728901bae3298c8bfd6d"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: LeaderboardEntry.self)
  }
}