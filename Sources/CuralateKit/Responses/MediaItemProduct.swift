//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct MediaItemProduct: Decodable {
    public let id: String
    public let name: String
    public let images: [NetworkPhoto]
    public let link: URL
    public let price: Price?
    public let metadata: [String : String]?
    public let spatialTag: SpatialTag?
}

public struct SpatialTag: Decodable {
    let x: Float
    let y: Float
    let label: String
}

public struct Price: Decodable {
    let display: String
    let value: Decimal?
    let currencySymbol: String?
    let currencyCode: String?
    let saleValue: Decimal?
    let saleDisplay: String?
    let isOnSale: Bool?
}
