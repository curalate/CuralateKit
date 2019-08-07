//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct PagingCursor: Codable {
    public let before: String?
    public let after: String?

    // We will inject this.
    var rid: String = ""

    private enum CodingKeys: String, CodingKey {
        case before
        case after
    }
}
