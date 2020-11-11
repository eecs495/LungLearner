//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateUserPointInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, username: String, points: Int, version: Int? = nil) {
    graphQLMap = ["id": id, "username": username, "points": points, "_version": version]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var points: Int {
    get {
      return graphQLMap["points"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var version: Int? {
    get {
      return graphQLMap["_version"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_version")
    }
  }
}

public struct ModelUserPointConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(username: ModelStringInput? = nil, points: ModelIntInput? = nil, and: [ModelUserPointConditionInput?]? = nil, or: [ModelUserPointConditionInput?]? = nil, not: ModelUserPointConditionInput? = nil) {
    graphQLMap = ["username": username, "points": points, "and": and, "or": or, "not": not]
  }

  public var username: ModelStringInput? {
    get {
      return graphQLMap["username"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var points: ModelIntInput? {
    get {
      return graphQLMap["points"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var and: [ModelUserPointConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserPointConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserPointConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserPointConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserPointConditionInput? {
    get {
      return graphQLMap["not"] as! ModelUserPointConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelStringInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public enum ModelAttributeTypes: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case binary
  case binarySet
  case bool
  case list
  case map
  case number
  case numberSet
  case string
  case stringSet
  case null
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "binary": self = .binary
      case "binarySet": self = .binarySet
      case "bool": self = .bool
      case "list": self = .list
      case "map": self = .map
      case "number": self = .number
      case "numberSet": self = .numberSet
      case "string": self = .string
      case "stringSet": self = .stringSet
      case "_null": self = .null
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .binary: return "binary"
      case .binarySet: return "binarySet"
      case .bool: return "bool"
      case .list: return "list"
      case .map: return "map"
      case .number: return "number"
      case .numberSet: return "numberSet"
      case .string: return "string"
      case .stringSet: return "stringSet"
      case .null: return "_null"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: ModelAttributeTypes, rhs: ModelAttributeTypes) -> Bool {
    switch (lhs, rhs) {
      case (.binary, .binary): return true
      case (.binarySet, .binarySet): return true
      case (.bool, .bool): return true
      case (.list, .list): return true
      case (.map, .map): return true
      case (.number, .number): return true
      case (.numberSet, .numberSet): return true
      case (.string, .string): return true
      case (.stringSet, .stringSet): return true
      case (.null, .null): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct ModelSizeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public struct ModelIntInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct UpdateUserPointInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, username: String? = nil, points: Int? = nil, version: Int? = nil) {
    graphQLMap = ["id": id, "username": username, "points": points, "_version": version]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var username: String? {
    get {
      return graphQLMap["username"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var points: Int? {
    get {
      return graphQLMap["points"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var version: Int? {
    get {
      return graphQLMap["_version"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_version")
    }
  }
}

public struct DeleteUserPointInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, version: Int? = nil) {
    graphQLMap = ["id": id, "_version": version]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var version: Int? {
    get {
      return graphQLMap["_version"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_version")
    }
  }
}

public struct ModelUserPointFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, username: ModelStringInput? = nil, points: ModelIntInput? = nil, and: [ModelUserPointFilterInput?]? = nil, or: [ModelUserPointFilterInput?]? = nil, not: ModelUserPointFilterInput? = nil) {
    graphQLMap = ["id": id, "username": username, "points": points, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var username: ModelStringInput? {
    get {
      return graphQLMap["username"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var points: ModelIntInput? {
    get {
      return graphQLMap["points"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var and: [ModelUserPointFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserPointFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserPointFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserPointFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserPointFilterInput? {
    get {
      return graphQLMap["not"] as! ModelUserPointFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public final class CreateUserPointMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateUserPoint($input: CreateUserPointInput!, $condition: ModelUserPointConditionInput) {\n  createUserPoint(input: $input, condition: $condition) {\n    __typename\n    id\n    username\n    points\n    _version\n    _deleted\n    _lastChangedAt\n    createdAt\n    updatedAt\n  }\n}"

  public var input: CreateUserPointInput
  public var condition: ModelUserPointConditionInput?

  public init(input: CreateUserPointInput, condition: ModelUserPointConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUserPoint", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateUserPoint.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUserPoint: CreateUserPoint? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUserPoint": createUserPoint.flatMap { $0.snapshot }])
    }

    public var createUserPoint: CreateUserPoint? {
      get {
        return (snapshot["createUserPoint"] as? Snapshot).flatMap { CreateUserPoint(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUserPoint")
      }
    }

    public struct CreateUserPoint: GraphQLSelectionSet {
      public static let possibleTypes = ["UserPoint"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String, points: Int, version: Int, deleted: Bool? = nil, lastChangedAt: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "UserPoint", "id": id, "username": username, "points": points, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return snapshot["username"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class UpdateUserPointMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateUserPoint($input: UpdateUserPointInput!, $condition: ModelUserPointConditionInput) {\n  updateUserPoint(input: $input, condition: $condition) {\n    __typename\n    id\n    username\n    points\n    _version\n    _deleted\n    _lastChangedAt\n    createdAt\n    updatedAt\n  }\n}"

  public var input: UpdateUserPointInput
  public var condition: ModelUserPointConditionInput?

  public init(input: UpdateUserPointInput, condition: ModelUserPointConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUserPoint", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateUserPoint.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateUserPoint: UpdateUserPoint? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateUserPoint": updateUserPoint.flatMap { $0.snapshot }])
    }

    public var updateUserPoint: UpdateUserPoint? {
      get {
        return (snapshot["updateUserPoint"] as? Snapshot).flatMap { UpdateUserPoint(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateUserPoint")
      }
    }

    public struct UpdateUserPoint: GraphQLSelectionSet {
      public static let possibleTypes = ["UserPoint"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String, points: Int, version: Int, deleted: Bool? = nil, lastChangedAt: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "UserPoint", "id": id, "username": username, "points": points, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return snapshot["username"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class DeleteUserPointMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteUserPoint($input: DeleteUserPointInput!, $condition: ModelUserPointConditionInput) {\n  deleteUserPoint(input: $input, condition: $condition) {\n    __typename\n    id\n    username\n    points\n    _version\n    _deleted\n    _lastChangedAt\n    createdAt\n    updatedAt\n  }\n}"

  public var input: DeleteUserPointInput
  public var condition: ModelUserPointConditionInput?

  public init(input: DeleteUserPointInput, condition: ModelUserPointConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteUserPoint", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteUserPoint.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteUserPoint: DeleteUserPoint? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteUserPoint": deleteUserPoint.flatMap { $0.snapshot }])
    }

    public var deleteUserPoint: DeleteUserPoint? {
      get {
        return (snapshot["deleteUserPoint"] as? Snapshot).flatMap { DeleteUserPoint(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteUserPoint")
      }
    }

    public struct DeleteUserPoint: GraphQLSelectionSet {
      public static let possibleTypes = ["UserPoint"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String, points: Int, version: Int, deleted: Bool? = nil, lastChangedAt: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "UserPoint", "id": id, "username": username, "points": points, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return snapshot["username"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class SyncUserPointsQuery: GraphQLQuery {
  public static let operationString =
    "query SyncUserPoints($filter: ModelUserPointFilterInput, $limit: Int, $nextToken: String, $lastSync: AWSTimestamp) {\n  syncUserPoints(filter: $filter, limit: $limit, nextToken: $nextToken, lastSync: $lastSync) {\n    __typename\n    items {\n      __typename\n      id\n      username\n      points\n      _version\n      _deleted\n      _lastChangedAt\n      createdAt\n      updatedAt\n    }\n    nextToken\n    startedAt\n  }\n}"

  public var filter: ModelUserPointFilterInput?
  public var limit: Int?
  public var nextToken: String?
  public var lastSync: Int?

  public init(filter: ModelUserPointFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil, lastSync: Int? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
    self.lastSync = lastSync
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken, "lastSync": lastSync]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("syncUserPoints", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken"), "lastSync": GraphQLVariable("lastSync")], type: .object(SyncUserPoint.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(syncUserPoints: SyncUserPoint? = nil) {
      self.init(snapshot: ["__typename": "Query", "syncUserPoints": syncUserPoints.flatMap { $0.snapshot }])
    }

    public var syncUserPoints: SyncUserPoint? {
      get {
        return (snapshot["syncUserPoints"] as? Snapshot).flatMap { SyncUserPoint(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "syncUserPoints")
      }
    }

    public struct SyncUserPoint: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelUserPointConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
        GraphQLField("startedAt", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil, startedAt: Int? = nil) {
        self.init(snapshot: ["__typename": "ModelUserPointConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken, "startedAt": startedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public var startedAt: Int? {
        get {
          return snapshot["startedAt"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "startedAt")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["UserPoint"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("points", type: .nonNull(.scalar(Int.self))),
          GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("_deleted", type: .scalar(Bool.self)),
          GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, username: String, points: Int, version: Int, deleted: Bool? = nil, lastChangedAt: Int, createdAt: String, updatedAt: String) {
          self.init(snapshot: ["__typename": "UserPoint", "id": id, "username": username, "points": points, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var username: String {
          get {
            return snapshot["username"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "username")
          }
        }

        public var points: Int {
          get {
            return snapshot["points"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "points")
          }
        }

        public var version: Int {
          get {
            return snapshot["_version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "_version")
          }
        }

        public var deleted: Bool? {
          get {
            return snapshot["_deleted"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "_deleted")
          }
        }

        public var lastChangedAt: Int {
          get {
            return snapshot["_lastChangedAt"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "_lastChangedAt")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }
      }
    }
  }
}

public final class GetUserPointQuery: GraphQLQuery {
  public static let operationString =
    "query GetUserPoint($id: ID!) {\n  getUserPoint(id: $id) {\n    __typename\n    id\n    username\n    points\n    _version\n    _deleted\n    _lastChangedAt\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserPoint", arguments: ["id": GraphQLVariable("id")], type: .object(GetUserPoint.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserPoint: GetUserPoint? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUserPoint": getUserPoint.flatMap { $0.snapshot }])
    }

    public var getUserPoint: GetUserPoint? {
      get {
        return (snapshot["getUserPoint"] as? Snapshot).flatMap { GetUserPoint(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUserPoint")
      }
    }

    public struct GetUserPoint: GraphQLSelectionSet {
      public static let possibleTypes = ["UserPoint"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String, points: Int, version: Int, deleted: Bool? = nil, lastChangedAt: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "UserPoint", "id": id, "username": username, "points": points, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return snapshot["username"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class ListUserPointsQuery: GraphQLQuery {
  public static let operationString =
    "query ListUserPoints($filter: ModelUserPointFilterInput, $limit: Int, $nextToken: String) {\n  listUserPoints(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      username\n      points\n      _version\n      _deleted\n      _lastChangedAt\n      createdAt\n      updatedAt\n    }\n    nextToken\n    startedAt\n  }\n}"

  public var filter: ModelUserPointFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelUserPointFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listUserPoints", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListUserPoint.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listUserPoints: ListUserPoint? = nil) {
      self.init(snapshot: ["__typename": "Query", "listUserPoints": listUserPoints.flatMap { $0.snapshot }])
    }

    public var listUserPoints: ListUserPoint? {
      get {
        return (snapshot["listUserPoints"] as? Snapshot).flatMap { ListUserPoint(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listUserPoints")
      }
    }

    public struct ListUserPoint: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelUserPointConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
        GraphQLField("startedAt", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil, startedAt: Int? = nil) {
        self.init(snapshot: ["__typename": "ModelUserPointConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken, "startedAt": startedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public var startedAt: Int? {
        get {
          return snapshot["startedAt"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "startedAt")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["UserPoint"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("points", type: .nonNull(.scalar(Int.self))),
          GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("_deleted", type: .scalar(Bool.self)),
          GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, username: String, points: Int, version: Int, deleted: Bool? = nil, lastChangedAt: Int, createdAt: String, updatedAt: String) {
          self.init(snapshot: ["__typename": "UserPoint", "id": id, "username": username, "points": points, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var username: String {
          get {
            return snapshot["username"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "username")
          }
        }

        public var points: Int {
          get {
            return snapshot["points"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "points")
          }
        }

        public var version: Int {
          get {
            return snapshot["_version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "_version")
          }
        }

        public var deleted: Bool? {
          get {
            return snapshot["_deleted"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "_deleted")
          }
        }

        public var lastChangedAt: Int {
          get {
            return snapshot["_lastChangedAt"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "_lastChangedAt")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }
      }
    }
  }
}

public final class OnCreateUserPointSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateUserPoint {\n  onCreateUserPoint {\n    __typename\n    id\n    username\n    points\n    _version\n    _deleted\n    _lastChangedAt\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateUserPoint", type: .object(OnCreateUserPoint.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateUserPoint: OnCreateUserPoint? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateUserPoint": onCreateUserPoint.flatMap { $0.snapshot }])
    }

    public var onCreateUserPoint: OnCreateUserPoint? {
      get {
        return (snapshot["onCreateUserPoint"] as? Snapshot).flatMap { OnCreateUserPoint(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateUserPoint")
      }
    }

    public struct OnCreateUserPoint: GraphQLSelectionSet {
      public static let possibleTypes = ["UserPoint"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String, points: Int, version: Int, deleted: Bool? = nil, lastChangedAt: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "UserPoint", "id": id, "username": username, "points": points, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return snapshot["username"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnUpdateUserPointSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateUserPoint {\n  onUpdateUserPoint {\n    __typename\n    id\n    username\n    points\n    _version\n    _deleted\n    _lastChangedAt\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateUserPoint", type: .object(OnUpdateUserPoint.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateUserPoint: OnUpdateUserPoint? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateUserPoint": onUpdateUserPoint.flatMap { $0.snapshot }])
    }

    public var onUpdateUserPoint: OnUpdateUserPoint? {
      get {
        return (snapshot["onUpdateUserPoint"] as? Snapshot).flatMap { OnUpdateUserPoint(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateUserPoint")
      }
    }

    public struct OnUpdateUserPoint: GraphQLSelectionSet {
      public static let possibleTypes = ["UserPoint"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String, points: Int, version: Int, deleted: Bool? = nil, lastChangedAt: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "UserPoint", "id": id, "username": username, "points": points, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return snapshot["username"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnDeleteUserPointSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteUserPoint {\n  onDeleteUserPoint {\n    __typename\n    id\n    username\n    points\n    _version\n    _deleted\n    _lastChangedAt\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteUserPoint", type: .object(OnDeleteUserPoint.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteUserPoint: OnDeleteUserPoint? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteUserPoint": onDeleteUserPoint.flatMap { $0.snapshot }])
    }

    public var onDeleteUserPoint: OnDeleteUserPoint? {
      get {
        return (snapshot["onDeleteUserPoint"] as? Snapshot).flatMap { OnDeleteUserPoint(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteUserPoint")
      }
    }

    public struct OnDeleteUserPoint: GraphQLSelectionSet {
      public static let possibleTypes = ["UserPoint"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .nonNull(.scalar(String.self))),
        GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_version", type: .nonNull(.scalar(Int.self))),
        GraphQLField("_deleted", type: .scalar(Bool.self)),
        GraphQLField("_lastChangedAt", type: .nonNull(.scalar(Int.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String, points: Int, version: Int, deleted: Bool? = nil, lastChangedAt: Int, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "UserPoint", "id": id, "username": username, "points": points, "_version": version, "_deleted": deleted, "_lastChangedAt": lastChangedAt, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return snapshot["username"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var points: Int {
        get {
          return snapshot["points"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "points")
        }
      }

      public var version: Int {
        get {
          return snapshot["_version"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_version")
        }
      }

      public var deleted: Bool? {
        get {
          return snapshot["_deleted"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "_deleted")
        }
      }

      public var lastChangedAt: Int {
        get {
          return snapshot["_lastChangedAt"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "_lastChangedAt")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}