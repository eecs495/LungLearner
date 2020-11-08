// swiftlint:disable all
import Amplify
import Foundation

extension UserPoint {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case username
    case points
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let userPoint = UserPoint.keys
    
    model.pluralName = "UserPoints"
    
    model.fields(
      .id(),
      .field(userPoint.username, is: .required, ofType: .string),
      .field(userPoint.points, is: .required, ofType: .int)
    )
    }
}