//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct MediaItem: Codable {
    public let id: String
    public let source: MediaItemSource
    public let labels: [String]
    public let media: MediaItemMedia?
    public let products: [MediaItemProduct]
}
