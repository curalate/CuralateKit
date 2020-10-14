//
//  Copyright (c) 2011-2019 Curalate, Inc.
//

import Foundation

public struct CuralateAPIError: Error {
    let code: Int
    let msg: String?
}
