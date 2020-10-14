//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct NetworkVideo: Decodable {
    public let original: Video
    public let highQuality: Video
    public let lowQuality: Video
    public let poster: NetworkPhoto?
}
