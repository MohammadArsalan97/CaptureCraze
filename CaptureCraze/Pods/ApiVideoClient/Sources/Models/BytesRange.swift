//
// BytesRange.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct BytesRange: Codable, Hashable {

    /** The starting point for the range of bytes for a chunk of a video. */
    public var from: Int?
    /** The ending point for the range of bytes for a chunk of a video. */
    public var to: Int?
    /** The total number of expected bytes. */
    public var total: Int?

    public init(from: Int? = nil, to: Int? = nil, total: Int? = nil) {
        self.from = from
        self.to = to
        self.total = total
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case from
        case to
        case total
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(from, forKey: .from)
        try container.encodeIfPresent(to, forKey: .to)
        try container.encodeIfPresent(total, forKey: .total)
    }
}

