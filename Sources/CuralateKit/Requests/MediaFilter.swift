//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public class MediaFilter {
    
    public enum MediaFilterKey {
        case productID
        case productURL
        case label
        case username
        case category
        case tag
        case other(String)
        
        public var stringValue: String {
            switch self {
            case .productID:
                return "productId"
            case .productURL:
                return "productUrl"
            case .label:
                return "label"
            case .username:
                return "username"
            case .category:
                return "category"
            case .tag:
                return "tag"
            case .other(let string):
                return string
            }
        }
    }
    
    fileprivate struct MediaFilterKeyValuePair {
        public let key: MediaFilterKey
        public let value: String
        
        public var stringValue: String {
            return "\(key.stringValue):\(value)"
        }
    }
    
    fileprivate enum MediaFilterOperator {
        case and
        case or
        
        public var stringValue: String {
            switch self {
            case .and:
                return "and"
            case .or:
                return "or"
            }
        }
    }
    
    fileprivate enum NodeType {
        case single
        case pair
    }
    
    fileprivate var nodeType: NodeType
    
    fileprivate var keyValue: MediaFilterKeyValuePair?
    fileprivate var lhs: MediaFilter?
    fileprivate var rhs: MediaFilter?
    fileprivate var op: MediaFilterOperator?
    
    public init(key: MediaFilterKey, value: String) {
        self.nodeType = .single
        self.keyValue = MediaFilterKeyValuePair(key: key, value: value)
    }
    
    fileprivate init(lhs: MediaFilter, op: MediaFilterOperator, rhs: MediaFilter) {
        self.nodeType = .pair
        self.lhs = lhs
        self.op = op
        self.rhs = rhs
    }
    
    public func and(_ filter: MediaFilter) -> MediaFilter {
        return MediaFilter(lhs: self, op: .and, rhs: filter)
    }
    
    public func or(_ filter: MediaFilter) -> MediaFilter {
        return MediaFilter(lhs: self, op: .or, rhs: filter)
    }
    
    var stringValue: String {
        var builder = MediaFilterPredicateStringBuilder(filter: self)
        return builder.stringValue()
    }
}

fileprivate struct MediaFilterPredicateStringBuilder {
    let filter: MediaFilter
    var level: Int = 0
    
    var workingString = ""
    
    init(filter: MediaFilter) {
        self.filter = filter
    }
    
    mutating func stringValue() -> String {
        if filter.nodeType == .single {
            return filter.keyValue!.stringValue
        }
        
        visit(filter)
        return workingString
    }
    
    mutating func single(_ filter: MediaFilter) {
        workingString.append(filter.keyValue!.stringValue)
    }
    
    mutating func pair(_ filter: MediaFilter) {
        if level > 0 { workingString.append("(") }
        level += 1
        visit(filter.lhs!)
        level -= 1
        workingString.append(" \(filter.op!.stringValue) ")
        level += 1
        visit(filter.rhs!)
        level -= 1
        if level > 0 { workingString.append(")") }
        
    }
    
    mutating func visit(_ filter: MediaFilter) {
        switch filter.nodeType {
        case .single:
            single(filter)
        case .pair:
            pair(filter)
        }
        
        workingString = workingString.replacingOccurrences(of: "( ", with: "(")
        workingString = workingString.replacingOccurrences(of: " )", with: ")")
    }
    
}
