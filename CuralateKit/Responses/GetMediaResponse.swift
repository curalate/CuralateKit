//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct GetMediaResponse: Decodable {
    
    let data: GetMediaResponseData
    let metadata: GetMediaResponseMetadata
    // We repurpose this property to simplify pagination on subsequent requests, which is why it needs to be mutable.
    var paging: GetMediaResponsePaging
    
    // Only present if the API sends an error
    let code: String?
    let msg: String?
    let errorId: String?
}

public struct GetMediaResponseData: Decodable {
    let items: [MediaItem]
    let resultsCount: Int
}

public struct GetMediaResponseMetadata: Decodable {
    let traceId: String
    let requestId: String?
    let firstPartyCuid: String?
    let curalateUserId: String?
    let customCuralateUserId: String?
    // TODO: add PDP metadata
}

public struct GetMediaResponsePaging: Decodable {
    // We repurpose this property to simplify pagination on subsequent requests, which is why it needs to be mutable.
    var cursors: PagingCursor
    let next: URL?
    let previous: URL?
}

