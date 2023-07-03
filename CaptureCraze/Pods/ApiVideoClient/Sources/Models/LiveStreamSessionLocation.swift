//
// LiveStreamSessionLocation.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** The location of the viewer of the live stream. */
public struct LiveStreamSessionLocation: Codable, Hashable {

    /** The country of the viewer of the live stream. */
    public var country: String?
    /** The city of the viewer of the live stream. */
    public var city: String?

    public init(country: String? = nil, city: String? = nil) {
        self.country = country
        self.city = city
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case country
        case city
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(country, forKey: .country)
        try container.encodeIfPresent(city, forKey: .city)
    }
}

