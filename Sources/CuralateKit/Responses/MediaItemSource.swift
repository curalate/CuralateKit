//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct MediaItemSource: Decodable {
    public let type: ItemType
    public let postedTimestamp: Int
    public let user: User?
    public let link: URL?
    public let caption: String?
    public let commentCount: Int?
    public let likeCount: Int?
    public let repinCount: Int?
    public let location: Location?
    public let sourceId: String?
}

public enum ItemType: String, Decodable {
    case pinterest
    case facebook
    case instagram
    case twitter
    case tumblr
    case mediaimport
}

public struct User: Decodable {
    public let username: String?
    public let displayName: String?
    public let link: URL?
    public let image: ThumbnailPhoto?
    public let followerCount: Int?
    public let followingCount: Int?
}

public struct Location: Decodable {
    public let name: String?
    public let latitude: Float?
    public let longitude: Float?
}

public struct ThumbnailPhoto: Decodable {
    public let original: Image
    public let small: Image
    public let medium: Image
    public let smallSquare: Image
    public let mediumSquare: Image
}
