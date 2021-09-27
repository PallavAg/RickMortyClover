// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetCharactersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getCharacters($page: Int) {
      characters(page: $page) {
        __typename
        info {
          __typename
          next
        }
        results {
          __typename
          id
          name
          status
          species
          image
        }
      }
    }
    """

  public let operationName: String = "getCharacters"

  public var page: Int?

  public init(page: Int? = nil) {
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("characters", arguments: ["page": GraphQLVariable("page")], type: .object(Character.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(characters: Character? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }])
    }

    /// Get the list of all characters
    public var characters: Character? {
      get {
        return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "characters")
      }
    }

    public struct Character: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Characters"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("info", type: .object(Info.selections)),
          GraphQLField("results", type: .list(.object(Result.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(info: Info? = nil, results: [Result?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Characters", "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }, "results": results.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var info: Info? {
        get {
          return (resultMap["info"] as? ResultMap).flatMap { Info(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "info")
        }
      }

      public var results: [Result?]? {
        get {
          return (resultMap["results"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "results")
        }
      }

      public struct Info: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Info"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("next", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(next: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Info", "next": next])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Number of the next page (if it exists)
        public var next: Int? {
          get {
            return resultMap["next"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "next")
          }
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Character"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("species", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, status: String? = nil, species: String? = nil, image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name, "status": status, "species": species, "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the character.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the character.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The status of the character ('Alive', 'Dead' or 'unknown').
        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        /// The species of the character.
        public var species: String? {
          get {
            return resultMap["species"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "species")
          }
        }

        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }
      }
    }
  }
}

public final class GetCharacterDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getCharacterDetail($id: ID!) {
      character(id: $id) {
        __typename
        id
        name
        image
        location {
          __typename
          id
          name
          type
          dimension
          residents {
            __typename
            id
          }
        }
      }
    }
    """

  public let operationName: String = "getCharacterDetail"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("character", arguments: ["id": GraphQLVariable("id")], type: .object(Character.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(character: Character? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "character": character.flatMap { (value: Character) -> ResultMap in value.resultMap }])
    }

    /// Get a specific character by ID
    public var character: Character? {
      get {
        return (resultMap["character"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "character")
      }
    }

    public struct Character: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Character"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("location", type: .object(Location.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, image: String? = nil, location: Location? = nil) {
        self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name, "image": image, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the character.
      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the character.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// Link to the character's image.
      /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      /// The character's last known location
      public var location: Location? {
        get {
          return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "location")
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Location"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("dimension", type: .scalar(String.self)),
            GraphQLField("residents", type: .nonNull(.list(.object(Resident.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, type: String? = nil, dimension: String? = nil, residents: [Resident?]) {
          self.init(unsafeResultMap: ["__typename": "Location", "id": id, "name": name, "type": type, "dimension": dimension, "residents": residents.map { (value: Resident?) -> ResultMap? in value.flatMap { (value: Resident) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the location.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the location.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The type of the location.
        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// The dimension in which the location is located.
        public var dimension: String? {
          get {
            return resultMap["dimension"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "dimension")
          }
        }

        /// List of characters who have been last seen in the location.
        public var residents: [Resident?] {
          get {
            return (resultMap["residents"] as! [ResultMap?]).map { (value: ResultMap?) -> Resident? in value.flatMap { (value: ResultMap) -> Resident in Resident(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Resident?) -> ResultMap? in value.flatMap { (value: Resident) -> ResultMap in value.resultMap } }, forKey: "residents")
          }
        }

        public struct Resident: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Character"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil) {
            self.init(unsafeResultMap: ["__typename": "Character", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the character.
          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}
