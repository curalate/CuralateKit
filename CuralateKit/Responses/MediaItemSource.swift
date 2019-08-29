//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct MediaItemSource: Codable {
    
    // Internal Types
    
    public enum ItemType: String, Codable {
        case pinterest
        case facebook
        case instagram
        case twitter
        case tumblr
        case mediaimport
    }

    public struct User: Codable {
        struct Image: Codable {
            let original: URL?
            let small: URL?
            let medium: URL?
            let smallSquare: URL?
            let mediumSquare: URL?
            
            enum LinkValueKeys: String, CodingKey {
                case link
            }
            
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                
                var nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .original)
                self.original = try nestedValues.decode(URL.self, forKey: .link)
                
                nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .small)
                self.small = try nestedValues.decode(URL.self, forKey: .link)
                
                nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .medium)
                self.medium = try nestedValues.decode(URL.self, forKey: .link)
                
                nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .smallSquare)
                self.smallSquare = try nestedValues.decode(URL.self, forKey: .link)
                
                nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .mediumSquare)
                self.mediumSquare = try nestedValues.decode(URL.self, forKey: .link)
            }
        }
        
        let username: String?
        let displayName: String?
        let link: URL?
        let image: Image?
        let followerCount: Int?
        let followingCount: Int?
    }
    
    public struct Location: Codable {
        let name: String
        let latitude: Float
        let longitude: Float
    }
    
    // Properties
    
    public let `type`: ItemType
    public let postedTimestamp: Int
    public let user: User?
    public let link: URL?
    public let caption: String?
    public let commentCount: Int?
    public let likeCount: Int?
    public let location: Location?
    public let sourceID: String?
    
    // Coding Keys
    
    enum CodingKeys: String, CodingKey {
        case type
        case postedTimestamp
        case user
        case link
        case caption
        case commentCount
        case likeCount
        case location
        case sourceID = "sourceId"
    }
}
