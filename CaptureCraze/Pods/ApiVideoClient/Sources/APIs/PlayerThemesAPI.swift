//
// PlayerThemesAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class PlayerThemesAPI {

    /**
     Create a player
     
     - parameter playerThemeCreationPayload: (body)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func create(playerThemeCreationPayload: PlayerThemeCreationPayload, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: PlayerTheme?, _ error: Error?) -> Void)) -> RequestTask {
            return createWithRequestBuilder(playerThemeCreationPayload: playerThemeCreationPayload).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Create a player
     - POST /players
     - Create a player for your video, and customise it.
     - parameter playerThemeCreationPayload: (body)  
     - returns: RequestBuilder<PlayerTheme> 
     */
    open class func createWithRequestBuilder(playerThemeCreationPayload: PlayerThemeCreationPayload) -> RequestBuilder<PlayerTheme> {
        let localVariablePath = "/players"
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: playerThemeCreationPayload)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PlayerTheme>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     Retrieve a player
     
     - parameter playerId: (path) The unique identifier for the player you want to retrieve.  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func get(playerId: String, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: PlayerTheme?, _ error: Error?) -> Void)) -> RequestTask {
            return getWithRequestBuilder(playerId: playerId).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Retrieve a player
     - GET /players/{playerId}
     - Use a player ID to retrieve details about the player and display it for viewers.
     - parameter playerId: (path) The unique identifier for the player you want to retrieve.  
     - returns: RequestBuilder<PlayerTheme> 
     */
    open class func getWithRequestBuilder(playerId: String) -> RequestBuilder<PlayerTheme> {
        var localVariablePath = "/players/{playerId}"
        let playerIdPreEscape = "\(APIHelper.mapValueToPathItem(playerId))"
        let playerIdPostEscape = playerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{playerId}", with: playerIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PlayerTheme>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     Update a player
     
     - parameter playerId: (path) The unique identifier for the player. 
     - parameter playerThemeUpdatePayload: (body)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func update(playerId: String, playerThemeUpdatePayload: PlayerThemeUpdatePayload, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: PlayerTheme?, _ error: Error?) -> Void)) -> RequestTask {
            return updateWithRequestBuilder(playerId: playerId, playerThemeUpdatePayload: playerThemeUpdatePayload).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Update a player
     - PATCH /players/{playerId}
     - Use a player ID to update specific details for a player.  NOTE: It may take up to 10 min before the new player configuration is available from our CDN.
     - parameter playerId: (path) The unique identifier for the player. 
     - parameter playerThemeUpdatePayload: (body)  
     - returns: RequestBuilder<PlayerTheme> 
     */
    open class func updateWithRequestBuilder(playerId: String, playerThemeUpdatePayload: PlayerThemeUpdatePayload) -> RequestBuilder<PlayerTheme> {
        var localVariablePath = "/players/{playerId}"
        let playerIdPreEscape = "\(APIHelper.mapValueToPathItem(playerId))"
        let playerIdPostEscape = playerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{playerId}", with: playerIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: playerThemeUpdatePayload)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PlayerTheme>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PATCH", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     Delete a player
     
     - parameter playerId: (path) The unique identifier for the player you want to delete. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func delete(playerId: String, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) -> RequestTask {
            return deleteWithRequestBuilder(playerId: playerId).execute(apiResponseQueue) { result in
                switch result {
                case .success:
                    completion((), nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Delete a player
     - DELETE /players/{playerId}
     - Delete a player if you no longer need it. You can delete any player that you have the player ID for.
     - parameter playerId: (path) The unique identifier for the player you want to delete. 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteWithRequestBuilder(playerId: String) -> RequestBuilder<Void> {
        var localVariablePath = "/players/{playerId}"
        let playerIdPreEscape = "\(APIHelper.mapValueToPathItem(playerId))"
        let playerIdPostEscape = playerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{playerId}", with: playerIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = ApiVideoClient.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     * enum for parameter sortBy
     */
    public enum SortBy_list: String, CaseIterable {
        case name = "name"
        case createdat = "createdAt"
        case updatedat = "updatedAt"
    }

    /**
     * enum for parameter sortOrder
     */
    public enum SortOrder_list: String, CaseIterable {
        case asc = "asc"
        case desc = "desc"
    }

    /**
     List all player themes
     
     - parameter sortBy: (query) createdAt is the time the player was created. updatedAt is the time the player was last updated. The time is presented in ISO-8601 format. (optional)
     - parameter sortOrder: (query) Allowed: asc, desc. Ascending for date and time means that earlier values precede later ones. Descending means that later values preced earlier ones. (optional)
     - parameter currentPage: (query) Choose the number of search results to return per page. Minimum value: 1 (optional, default to 1)
     - parameter pageSize: (query) Results per page. Allowed values 1-100, default is 25. (optional, default to 25)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func list(sortBy: SortBy_list? = nil, sortOrder: SortOrder_list? = nil, currentPage: Int? = nil, pageSize: Int? = nil, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: PlayerThemesListResponse?, _ error: Error?) -> Void)) -> RequestTask {
            return listWithRequestBuilder(sortBy: sortBy, sortOrder: sortOrder, currentPage: currentPage, pageSize: pageSize).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     List all player themes
     - GET /players
     - Retrieve a list of all the player themes you created, as well as details about each one. Tutorials that use the [player endpoint](https://api.video/blog/endpoints/player).
     - parameter sortBy: (query) createdAt is the time the player was created. updatedAt is the time the player was last updated. The time is presented in ISO-8601 format. (optional)
     - parameter sortOrder: (query) Allowed: asc, desc. Ascending for date and time means that earlier values precede later ones. Descending means that later values preced earlier ones. (optional)
     - parameter currentPage: (query) Choose the number of search results to return per page. Minimum value: 1 (optional, default to 1)
     - parameter pageSize: (query) Results per page. Allowed values 1-100, default is 25. (optional, default to 25)
     - returns: RequestBuilder<PlayerThemesListResponse> 
     */
    open class func listWithRequestBuilder(sortBy: SortBy_list? = nil, sortOrder: SortOrder_list? = nil, currentPage: Int? = nil, pageSize: Int? = nil) -> RequestBuilder<PlayerThemesListResponse> {
        let localVariablePath = "/players"
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "sortBy": sortBy?.encodeToJSON(),
            "sortOrder": sortOrder?.encodeToJSON(),
            "currentPage": currentPage?.encodeToJSON(),
            "pageSize": pageSize?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PlayerThemesListResponse>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     Upload a logo
     
     - parameter playerId: (path) The unique identifier for the player. 
     - parameter file: (form) The name of the file you want to use for your logo. 
     - parameter link: (form) A public link that you want to advertise in your player. For example, you could add a link to your company. When a viewer clicks on your logo, they will be taken to this address. (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func uploadLogo(playerId: String, file: URL, link: String? = nil, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: PlayerTheme?, _ error: Error?) -> Void)) -> RequestTask {
            return uploadLogoWithRequestBuilder(playerId: playerId, file: file, link: link).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    completion(response.body, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Upload a logo
     - POST /players/{playerId}/logo
     - The uploaded image maximum size should be 200x100 and its weight should be 100KB.  It will be scaled down to 30px height and converted to PNG to be displayed in the player.
     - parameter playerId: (path) The unique identifier for the player. 
     - parameter file: (form) The name of the file you want to use for your logo. 
     - parameter link: (form) A public link that you want to advertise in your player. For example, you could add a link to your company. When a viewer clicks on your logo, they will be taken to this address. (optional)
     - returns: RequestBuilder<PlayerTheme> 
     */
    open class func uploadLogoWithRequestBuilder(playerId: String, file: URL, link: String? = nil) -> RequestBuilder<PlayerTheme> {
        var localVariablePath = "/players/{playerId}/logo"
        let playerIdPreEscape = "\(APIHelper.mapValueToPathItem(playerId))"
        let playerIdPostEscape = playerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{playerId}", with: playerIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableFormParams: [String: Any?] = [
            "file": file.encodeToJSON(),
            "link": link?.encodeToJSON(),
        ]
        let localVariableNonNullParameters = APIHelper.rejectNil(localVariableFormParams)
        let localVariableParameters = APIHelper.convertBoolToString(localVariableNonNullParameters)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "Content-Type": "multipart/form-data",
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<PlayerTheme>.Type = ApiVideoClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }


    /**
     Delete logo
     
     - parameter playerId: (path) The unique identifier for the player. 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects.
     */
    @discardableResult
    open class func deleteLogo(playerId: String, apiResponseQueue: DispatchQueue = ApiVideoClient.apiResponseQueue, completion: @escaping ((_ data: Void?, _ error: Error?) -> Void)) -> RequestTask {
            return deleteLogoWithRequestBuilder(playerId: playerId).execute(apiResponseQueue) { result in
                switch result {
                case .success:
                    completion((), nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
    }


    /**
     Delete logo
     - DELETE /players/{playerId}/logo
     - Delete the logo associated to a player.
     - parameter playerId: (path) The unique identifier for the player. 
     - returns: RequestBuilder<Void> 
     */
    open class func deleteLogoWithRequestBuilder(playerId: String) -> RequestBuilder<Void> {
        var localVariablePath = "/players/{playerId}/logo"
        let playerIdPreEscape = "\(APIHelper.mapValueToPathItem(playerId))"
        let playerIdPostEscape = playerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{playerId}", with: playerIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = ApiVideoClient.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = ApiVideoClient.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

}
