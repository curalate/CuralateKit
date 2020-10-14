//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

open class Client: NSObject {

    let contentTypeFormUrlEncoded = "application/x-www-form-urlencoded"
    let headerContentType = "Content-Type"
    let headerHost = "Host"
    let headerUserAgent = "User-Agent"
    let methodTypePost = "POST"
    let methodTypePut = "PUT"

    let userAgent: String
    let hostname: String

    init(
        userAgent: String = "CuralateKit",
        hostname: String = "api-2.curalate.com"
    ) {
        self.userAgent = userAgent
        self.hostname = hostname
    }

    /*
     Make the specified API call.
     */
    func apiCall(
        _ method: String,
        path: String,
        params: Dictionary<String, String>,
        completion: @escaping (Int, Data?) -> ()
    ) {
        let queryString: String = makeQueryString(params)
        let uri: String
        var headers = [
            headerHost: self.hostname,
            headerUserAgent: self.userAgent
        ]
        let body: String

        if [methodTypePost, methodTypePut].contains(method) {
            uri = path
            headers[headerContentType] = contentTypeFormUrlEncoded
            body = queryString
        } else {
            uri = queryString != "" ? "\(path)?\(queryString)" : path
            body = ""
        }

        // Do the request.
        let session: URLSession
        let request: URLRequest
        (session, request) = self.createSessionAndRequest(method, uri: uri, headers: headers, body: body)
        self.makeRequest(session, request: request, completion: completion)
    }
    
    //
    // Private Helpers
    //

    /*
    Instantiate the a URLSession/URLRequest for the given parameters
     */
    private func createSessionAndRequest(
        _ method: String,
        uri: String,
        headers: Dictionary<String, String>,
        body: String
    ) -> (URLSession, URLRequest) {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = headers
        let session = URLSession.init(configuration: config)
        let url = URL(string: "https://\(self.hostname)\(uri)")
        var request = URLRequest.init(url: url!)
        request.httpMethod = method
        if body != "" {
            request.httpBody = body.data(using: String.Encoding.utf8)
        }
        return (session, request)
    }

    /*
     Execute the given URLRequest.
     */
    private func makeRequest(
        _ session: URLSession,
        request: URLRequest,
        completion: @escaping (Int, Data?) -> ()
    ) {
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if error != nil {
                print("Error making request: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                completion(httpResponse.statusCode, data)
            } else {
                print("Error making request: no response")
            }
        })
        task.resume()
    }
    
    /*
     Turn the given parameter map into a URL friendly query string.
     */
    private func makeQueryString(_ params: Dictionary<String, String>) -> String {
        return params.sorted(by: {
            $0.0.compare($1.0, options: NSString.CompareOptions.literal) == ComparisonResult.orderedAscending
        }).map({
            $0.toUTF8().encodeForQueryString()! + "=" + $1.toUTF8().encodeForQueryString()!
        }).joined(separator: "&")
    }
}
