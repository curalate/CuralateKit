//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public enum NetworkMedia: Decodable {
    case networkPhoto(NetworkPhoto)
    case networkVideo(NetworkVideo)
    case networkGif(NetworkGif)
  
    enum CodingKeys: String, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
                let mediaType = try container.decode(MediaType.self, forKey: .type)
        switch mediaType {
        case MediaType.photo:
            self = .networkPhoto(try decoder.singleValueContainer().decode(NetworkPhoto.self))
        case MediaType.video:
            self = .networkVideo(try decoder.singleValueContainer().decode(NetworkVideo.self))
        case MediaType.gif:
            self = .networkGif(try decoder.singleValueContainer().decode(NetworkGif.self))
        }
    }
}

public enum MediaType: String, Decodable {
    case photo = "photo"
    case gif = "gif"
    case video = "video"
}
