// swiftlint:disable all
import Amplify
import Foundation

extension LeaderboardEntry {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case username
    case score
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let leaderboardEntry = LeaderboardEntry.keys
    
    model.pluralName = "LeaderboardEntries"
    
    model.fields(
      .id(),
      .field(leaderboardEntry.username, is: .required, ofType: .string),
      .field(leaderboardEntry.score, is: .required, ofType: .int)
    )
    }
}