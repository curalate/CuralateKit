//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct MediaItemMedia: Codable {
    
    public enum MediaType: String, Codable {
        case photo
        case gif
        case video
    }
    
    public let id: String
    public let original: URL?
    public let small: URL?
    public let medium: URL?
    public let large: URL?
    public let extraLarge: URL?
    public let smallSquare: URL?
    public let mediumSquare: URL?
    public let largeSquare: URL?
    public let extraLargeSquare: URL?
    public let `type`: MediaType?
    
    enum LinkValueKeys: String, CodingKey {
        case link
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.type = try values.decode(MediaType.self, forKey: .type)
        
        var nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .original)
        self.original = try nestedValues.decode(URL.self, forKey: .link)
        
        nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .small)
        self.small = try nestedValues.decode(URL.self, forKey: .link)
        
        nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .medium)
        self.medium = try nestedValues.decode(URL.self, forKey: .link)
        
        nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .large)
        self.large = try nestedValues.decode(URL.self, forKey: .link)
        
        nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .extraLarge)
        self.extraLarge = try nestedValues.decode(URL.self, forKey: .link)
        
        nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .smallSquare)
        self.smallSquare = try nestedValues.decode(URL.self, forKey: .link)
        
        nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .mediumSquare)
        self.mediumSquare = try nestedValues.decode(URL.self, forKey: .link)
        
        nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .largeSquare)
        self.largeSquare = try nestedValues.decode(URL.self, forKey: .link)
        
        nestedValues = try values.nestedContainer(keyedBy: LinkValueKeys.self, forKey: .extraLargeSquare)
        self.extraLargeSquare = try nestedValues.decode(URL.self, forKey: .link)
    }
}
