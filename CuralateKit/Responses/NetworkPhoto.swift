//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct NetworkPhoto: Decodable {
    let id: String
    let original: Image
    let small: Image
    let medium: Image
    let large: Image
    let extraLarge: Image
    let smallSquare: Image
    let mediumSquare: Image
    let largeSquare: Image
    let extraLargeSquare: Image
}
