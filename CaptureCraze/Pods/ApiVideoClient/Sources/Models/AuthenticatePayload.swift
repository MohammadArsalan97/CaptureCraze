//
// AuthenticatePayload.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AuthenticatePayload: Codable, Hashable {

    /** Your account API key. You can use your sandbox API key, or you can use your production API key. */
    public var apiKey: String

    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case apiKey
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(apiKey, forKey: .apiKey)
    }
}
