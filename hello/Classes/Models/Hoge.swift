//
//  Hoge.swift
//  hello
//
//  Created by usr0600439 on 2016/09/02.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import Foundation

class Hoge {
    var id: Int
    var content: String
    
    init(id: Int, content: String) {
        self.id = id
        self.content = content
    }
    
    static func fetchHoges(handler: (Array<Hoge> -> Void)) {
        APIClient.request(Endpoint.HogeIndex) { json in
            let hoges = json["data"].arrayValue.map {
                Hoge(id: $0["id"].intValue, content: $0["content"].stringValue)
            }
            handler(hoges)
        }
    }
}