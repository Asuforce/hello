//
//  DateManager.swift
//  hello
//
//  Created by usr0600439 on 2016/09/06.
//  Copyright © 2016年 GMO Pepabo. All rights reserved.
//

import UIKit

extension Date {
    func monthAgeDate() ->Date {
        let addValue = -1
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return (calendar as NSCalendar).date(byAdding: dateComponents, to: self, options: NSCalendar.Options(rawValue: 0))!
    }
    
    func monthLaterDate() ->Date {
        let addValue = 1
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return (calendar as NSCalendar).date(byAdding: dateComponents, to: self, options: NSCalendar.Options(rawValue: 0))!
    }
}

class DateManager: NSObject {
    var currentMonthOfDates = [Date]()
    var selectedDate = Date()
    let daysPerWeek: Int = 7
    var numberOfItems: Int!
    
    func daysAcquisition() -> Int {
        let rangeOfWeeks = (Calendar.current as NSCalendar).range(of: NSCalendar.Unit.weekOfMonth, in: NSCalendar.Unit.month, for: firstDateOfMonth())
        let numberOfWeeks = rangeOfWeeks.length
        numberOfItems = numberOfWeeks * daysPerWeek
        return numberOfItems
    }
    
    func firstDateOfMonth() -> Date {
        var components = (Calendar.current as NSCalendar).components([.year, .month, .day], from: selectedDate)
        components.day = 1
        let firstDateMonth = Calendar.current.date(from: components)!
        return firstDateMonth
    }
    
    func dateForCellAtIndexPath(_ numberOfItems: Int) {
        let ordinalityOfFirstDay = (Calendar.current as NSCalendar).ordinality(of: NSCalendar.Unit.day, in: NSCalendar.Unit.weekOfMonth, for: firstDateOfMonth())
        for i in 0 ..< numberOfItems {
            var dateComponents = DateComponents()
            dateComponents.day = i - (ordinalityOfFirstDay - 1)
            let date = (Calendar.current as NSCalendar).date(byAdding: dateComponents, to: firstDateOfMonth(), options: NSCalendar.Options(rawValue: 0))!
            currentMonthOfDates.append(date)
        }
    }
    
    func conversionDateFormat(_ indexPath: IndexPath) -> String {
        dateForCellAtIndexPath(numberOfItems)
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: currentMonthOfDates[(indexPath as NSIndexPath).row])
    }
    
    func prevMonth(_ date: Date) -> Date {
        currentMonthOfDates = []
        selectedDate = date.monthAgeDate()
        return selectedDate
    }
    
    func nextMonth(_ date: Date) -> Date {
        currentMonthOfDates = []
        selectedDate = date.monthLaterDate()
        return selectedDate
    }
}
