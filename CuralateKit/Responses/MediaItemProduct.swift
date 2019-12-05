//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct MediaItemProduct: Decodable {
    let id: String
    let name: String
    let images: [NetworkPhoto]
    let link: URL
    let price: Price?
    let metadata: [String : String]?
    let spatialTag: SpatialTag?
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
