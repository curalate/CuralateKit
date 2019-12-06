//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct NetworkVideo: Decodable {
    let original: Video
    let highQuality: Video
    let lowQuality: Video
    let poster: NetworkPhoto?
}
