//
//  helloUITests.swift
//  helloUITests
//
//  Created by usr0600439 on 2016/09/01.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import XCTest

class helloUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCounting() {
        let app = XCUIApplication()
        let countIncreaseButton = app.buttons["増える"]
        let countDegreaseButton = app.buttons["減る"]
        let countLabel  = app.staticTexts["countLabel"]

        countIncreaseButton.tap()
        
        XCTAssertEqual("1", countLabel.label)
        
        countDegreaseButton.tap()
     
        XCTAssertEqual("0", countLabel.label)
    }
}
