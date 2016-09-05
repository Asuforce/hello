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
    var lebel: Int
    var image_url: String
    
    init(name: String, lebel: Int, image_url: String) {
        self.name = name
        self.lebel = lebel
        self.image_url = image_url
    }
    
    static func fetchFriends(handler: (Array<Friend> -> Void)) {
        APIClient.request(Endpoint.FriendIndex) { json in
            let friends = json["data"].arrayValue.map {
                Friend(name: $0["name"].stringValue, lebel: $0["lebel"].intValue, image_url: $0["image_url"].stringValue)
            }
            
            handler(friends)
        }
    }
}