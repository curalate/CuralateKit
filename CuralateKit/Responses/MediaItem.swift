//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct MediaItem: Decodable {
    let id: String
    let source: MediaItemSource
    let labels: [String]
    let media: NetworkMedia
    let products: [MediaItemProduct]
}
