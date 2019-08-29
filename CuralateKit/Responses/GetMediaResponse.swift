//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct GetMediaResponse: Codable {
    
    public var data: GetMediaResponseData?
    public let metadata: GetMediaResponseMetadata?
    public var paging: GetMediaResponsePaging?
    
    // Only present if the API sends an error
    public let code: String?
    public let msg: String?
    public let errorId: String?
}

public struct GetMediaResponseData: Codable {
    public var items: [MediaItem]
    public var resultsCount: Int
}

public struct GetMediaResponseMetadata: Codable {
    public var traceId: String
    public var requestId: String
    public var curalateUserId: String
}

public struct GetMediaResponsePaging: Codable {
    public var cursors: PagingCursor?
    public var next: URL?
    public var previous: URL?
}

