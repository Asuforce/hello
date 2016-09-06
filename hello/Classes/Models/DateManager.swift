//
//  DateManager.swift
//  hello
//
//  Created by usr0600439 on 2016/09/06.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import Foundation

class DateManager: NSObject {
    var currentMonthOfDates = [NSDate]()
    var selectedDate = NSDate()
    let daysPerWeek: Int = 7
    var numberOfItems: Int!
    
    func daysAcquisition() -> Int {
        let rangeOfWeeks = NSCalendar.currentCalendar().rangeOfUnit(NSCalendarUnit.WeekOfMonth, inUnit: NSCalendarUnit.Month, forDate: firstDateOfMonth())
        let numberOfWeeks = rangeOfWeeks.length
        numberOfItems = numberOfWeeks * daysPerWeek
        return numberOfItems
    }
    
    func firstDateOfMonth() -> NSDate {
        let components = NSCalendar.currentCalendar().components([.Year, .Month, .Day], fromDate: selectedDate)
        components.day = 1
        let firstDateMonth = NSCalendar.currentCalendar().dateFromComponents(components)!
        return firstDateMonth
    }
}
