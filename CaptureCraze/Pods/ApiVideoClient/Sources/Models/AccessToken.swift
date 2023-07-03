//
// AccessToken.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AccessToken: Codable, Hashable {

    /** The access token containing security credentials allowing you to acccess the API. The token lasts for one hour. */
    public var accessToken: String?
    /** The type of token you have. */
    public var tokenType: String? = "bearer"
    /** A token you can use to get the next access token when your current access token expires. */
    public var refreshToken: String?
    /** Lists the time in seconds when your access token expires. It lasts for one hour. */
    public var expiresIn: Int?

    public init(accessToken: String? = nil, tokenType: String? = "bearer", refreshToken: String? = nil, expiresIn: Int? = nil) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.refreshToken = refreshToken
        self.expiresIn = expiresIn
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(accessToken, forKey: .accessToken)
        try container.encodeIfPresent(tokenType, forKey: .tokenType)
        try container.encodeIfPresent(refreshToken, forKey: .refreshToken)
        try container.encodeIfPresent(expiresIn, forKey: .expiresIn)
    }
}

