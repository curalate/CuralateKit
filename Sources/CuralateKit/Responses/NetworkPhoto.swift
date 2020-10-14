//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct NetworkPhoto: Decodable {
    public let id: String
    public let original: Image
    public let small: Image
    public let medium: Image
    public let large: Image
    public let extraLarge: Image
    public let smallSquare: Image
    public let mediumSquare: Image
    public let largeSquare: Image
    public let extraLargeSquare: Image
}
