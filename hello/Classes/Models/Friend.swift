//
//  Friend.swift
//  hello
//
//  Created by usr0600439 on 2016/09/05.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import Foundation

class Friend {
    var name: String
    var level: Int
    var image_url: String
    
    init(name: String, level: Int, image_url: String) {
        self.name = name
        self.level = level
        self.image_url = image_url
    }
    
    static func fetchFriends(_ handler: @escaping ((Array<Friend>) -> Void)) {
        APIClient.request(Endpoint.friendIndex) { json in
            let friends = json["data"].arrayValue.map {
                Friend(name: $0["name"].stringValue, level: $0["level"].intValue, image_url: $0["image_url"].stringValue)
            }
            handler(friends)
        }
    }
}
