//
//  APIClient.swift
//  hello
//
//  Created by usr0600439 on 2016/09/02.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIClient {
    static private let baseUrl = "https://engineers-training.herokuapp.com"

    static func request(endpoint: Endpoint, handler: (json: JSON) -> Void) {
        let method = endpoint.method()
        let url = fullURL(endpoint)

        Alamofire.request(method, url).validate(statusCode: 200...299).responseJSON { response in
            switch response.result {
            case .Success(let value):
                handler(json: JSON(value))
            case .Failure(let error):
                print(error)
            }
        }
    }

    static private func fullURL(endpoint: Endpoint) -> String {
        return baseUrl + endpoint.path()
    }
}

enum Endpoint {
    case HogeIndex

    func method() -> Alamofire.Method {
        switch self {
        case .HogeIndex: return .GET
        }
    }

    func path() -> String {
        switch self {
        case .HogeIndex: return "/api/microposts"
        }
    }
}