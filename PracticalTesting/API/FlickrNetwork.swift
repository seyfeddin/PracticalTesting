//
//  FlickrNetwork.swift
//  PracticalTesting
//
//  Created by Seyfeddin Bassarac on 25/01/2018.
//  Copyright © 2018 ThreadCo. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

public struct FlickrNetwork {
    static let provider = MoyaProvider<FlickrAPIService>(plugins: [NetworkLoggerPlugin(cURL: true)])

    @discardableResult static public func request(
        target: FlickrAPIService,
        success successCallback: @escaping (JSON) -> Void,
        error errorCallback: @escaping (_ message : String, _ statusCode: Int) -> Void,
        failure failureCallback: @escaping (MoyaError) -> Void
        ) -> Cancellable {

        let pluginsArray:[PluginType] = [NetworkLoggerPlugin(cURL: true)]

        let provider = MoyaProvider<FlickrAPIService>(plugins: pluginsArray)

        return provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    _ = try response.filterSuccessfulStatusCodes()
                    let json = try JSON(response.mapJSON())
                    successCallback(json)
                }
                catch MoyaError.statusCode(let errorResponse) {
                    errorCallback(errorResponse.description, errorResponse.statusCode)

                } catch MoyaError.underlying(let nsError, _) {
                    let error = nsError as NSError
                    errorCallback(error.localizedDescription, 0)
                } catch {
                    errorCallback("error", 0)

                }
            case let .failure(error):
                failureCallback(error)
            }
        }
    }

}
