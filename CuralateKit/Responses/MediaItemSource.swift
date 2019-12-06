//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct MediaItemSource: Decodable {
    let type: ItemType
    let postedTimestamp: Int
    let user: User?
    let link: URL?
    let caption: String?
    let commentCount: Int?
    let likeCount: Int?
    let repinCount: Int?
    let location: Location?
    let sourceId: String?
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
    let username: String?
    let displayName: String?
    let link: URL?
    let image: ThumbnailPhoto?
    let followerCount: Int?
    let followingCount: Int?
}

public struct Location: Decodable {
    let name: String?
    let latitude: Float?
    let longitude: Float?
}

public struct ThumbnailPhoto: Decodable {
    let original: Image
    let small: Image
    let medium: Image
    let smallSquare: Image
    let mediumSquare: Image
}
