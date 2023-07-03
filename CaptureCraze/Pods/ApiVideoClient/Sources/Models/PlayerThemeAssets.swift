//
// PlayerThemeAssets.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct PlayerThemeAssets: Codable, Hashable {

    /** The name of the file containing the logo you want to use. */
    public var logo: String?
    /** The path to the file containing your logo. */
    public var link: String?

    public init(logo: String? = nil, link: String? = nil) {
        self.logo = logo
        self.link = link
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case logo
        case link
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(logo, forKey: .logo)
        try container.encodeIfPresent(link, forKey: .link)
    }
}

