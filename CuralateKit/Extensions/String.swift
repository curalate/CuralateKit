//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

extension String {
    var ns: NSString { return self as NSString }

    func encodeForQueryString() -> String? {
        let unreserved = "-._~"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        return addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
    }

    func toUTF8() -> String {
        return String(bytes: [UInt8](self.utf8), encoding: String.Encoding.utf8)!
    }
}
