//
//  Copyright (c) 2011-2019 Curalate, Inc.
//

import Foundation

open class Curalate: Client {

    let dataSourceId: String
    var rid = UUID().uuidString
    var fpcuid = UUID().uuidString

    public init(
        dataSourceId: String,
        userAgent: String = "CuralateKit",
        hostname: String = "api-2.curalate.com"
    ) {
        self.dataSourceId = dataSourceId
        super.init(userAgent: userAgent, hostname: hostname)
    }

    public func getMedia(
        filter: MediaFilter? = nil,
        requireProduct: Bool? = false,
        productMetadata: [String]? = nil,
        locale: Locale? = nil,
        sort: MediaSort? = nil,
        limit: Int? = nil,
        after: String? = nil,
        before: String? = nil,
        completion: @escaping (GetMediaResponse?, Error?) -> ()
    ) {
        let path = "/v1/media/" + self.dataSourceId;

        var params: Dictionary<String, String> = [:]
        if let filter: MediaFilter = filter {
            params["filter"] = filter.stringValue;
        }
        if let requireProduct: Bool = requireProduct {
            params["requireProduct"] = "\(requireProduct)";
        }
        if let productMetadata: [String] = productMetadata {
            params["productMetadata"] = productMetadata.joined(separator: ",")
        }
        if let locale: Locale = locale {
            if let languageCode = locale.languageCode, let regionCode = locale.regionCode {
                params["locale"] = "\(languageCode)-\(regionCode)"
            }
        }
        if let sort: MediaSort = sort {
            params["sort"] = "\(sort.rawValue)"
        }
        if let limit: Int = limit {
            params["limit"] = "\(limit)"
        }
        if let after: String = after {
            params["after"] = "\(after)"
        }
        if let before: String = before {
            params["before"] = "\(before)"
        }

        // Callback logic.
        func onCompletion(code: Int, data: Data?) {
            if let data: Data = data {
                do {
                    var response = try JSONDecoder().decode(GetMediaResponse.self, from: data)

                    // Special case RID
                    if let requestId = response.metadata.requestId {
                        response.paging.cursors.rid = requestId
                    }

                    if code == 200 {
                        completion(response, nil)
                        return
                    } else {
                        let error = CuralateAPIError(code: code, msg: response.msg)
                        completion(nil, error)
                        return
                    }
                } catch let error {
                    completion(nil, error)
                }
            } else {
                let error = CuralateAPIError(code: code, msg: nil)
                completion(nil, error)
            }
        }

        self.apiCall(
            "GET",
            path: path,
            params: params,
            completion: onCompletion
        )
    }

    public func recordEvent(
        type: EventType,
        itemId: String? = nil,
        productId: String? = nil,
        position: Int? = nil
    ) {
        // TODO: merge in event queueing/batching logic
    }

    public func newPage() {
        rid = UUID().uuidString
    }

    public func resetSession() {
        fpcuid = UUID().uuidString
    }
}
