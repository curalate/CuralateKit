//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public enum EventType: String, Codable {
    case pageImpression
    case pageViewableImpression
    case itemViewableImpression
    case itemHover
    case itemClick
    case productViewableImpression
    case productHover
    case productClick
    case pageImpressionNoContent
}
