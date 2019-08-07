//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct MediaItemProduct: Codable {
    
    public struct SpatialTag: Codable {
        let x: Float
        let y: Float
        let label: String
    }
    
    public let id: String
    public let name: String
    public let images: [MediaItemMedia]
    public let link: URL
    public let displayPrice: String?
    public let metadata: [String : String]?
    public let spatialTag: SpatialTag?
}
