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
    static fileprivate let baseUrl = "https://engineers-training.herokuapp.com"
    
    static func request(_ endpoint: Endpoint, handler: @escaping (_ json: JSON) -> Void) {
        let method = endpoint.method()
        let url = fullURL(endpoint)
        
        Alamofire.request(url, method: method).validate(statusCode: 200...299).responseJSON { response in
            switch response.result {
            case .success(let value):
                handler(JSON(value))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static fileprivate func fullURL(_ endpoint: Endpoint) -> String {
        return baseUrl + endpoint.path()
    }
}

enum Endpoint {
    case hogeIndex
    case friendIndex
    
    func method() -> Alamofire.HTTPMethod {
        return .get
    }
    
    func path() -> String {
        switch self {
        case .hogeIndex:
            return "/api/microposts"
        case .friendIndex:
            return "/api/characters"
        }
    }
}
