//
//  FlickrAPI.swift
//  PracticalTesting
//
//  Created by Seyfeddin Bassarac on 25/01/2018.
//  Copyright © 2018 ThreadCo. All rights reserved.
//

import Moya

public enum FlickrAPIService {
    case interestingPhotos
}

extension FlickrAPIService: TargetType {
    /// The target's base `URL`.
    public var baseURL: URL { return URL(string: "https://api.flickr.com/services/rest")! }

    /// The path to be appended to `baseURL` to form the full `URL`.
    public var path: String {
        return ""
    }

    /// The HTTP method used in the request.
    public var method: Moya.Method {
        switch self {
        case .interestingPhotos:
            return .get
        default:
            return .get
        }
    }

    /// Provides stub data for use in testing.
    public var sampleData: Data {
        return "".data(using: .utf8)!
    }

    /// The type of HTTP task to be performed.
    public var task: Task {
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)

    }

    public var parameters: [String: Any] {
        return [
            "method":"flickr.interestingness.getList",
            "extras" : "url_h,date_taken,owner_name,license",
            "format" : "json",
            "nojsoncallback" : "1",
            "api_key" : "535c7e68f6b25957ced3031b7099b240"
        ]

    }

    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    public var validate: Bool { return true }

    /// The headers to be used in the request.
    public var headers: [String: String]? { return nil }
}
