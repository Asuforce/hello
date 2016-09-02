//
//  Counter.swift
//  hello
//
//  Created by usr0600439 on 2016/09/01.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import Foundation

class Counter {
    private var count: Int
    
    init() {
        self.count = 0
    }
    
    func countUp() {
        self.count += 1
    }
    
    func countDown() {
        self.count -= 1
    }
    
    func current () -> Int {
        return self.count;
    }
}