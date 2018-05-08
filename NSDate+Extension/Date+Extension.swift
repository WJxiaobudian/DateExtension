//
//  NSDate+Extension.swift
//  NSDate+Extension
//
//  Created by 王洁 on 2018/5/8.
//  Copyright © 2018年 王洁. All rights reserved.
//

import Foundation

extension Date {
    
    // 比较时间差
    public func deltaFrom(from:Date) -> DateComponents {
        let calender = Calendar.current
        let unit = calender.dateComponents([.day, .year, .month, .hour, .minute, .second], from: self as Date, to: from)
        return unit
    }
    
    // 是否今年
    public func isThisYear() -> Bool {
        let calender = Calendar.current
        let nowYear  = calender.dateComponents([.year], from: Date())
        let selfYear = calender.dateComponents([.year], from: self as Date)
        return nowYear == selfYear
    }
    
    // 是否今天
    public func isToday() -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let nowString = formatter.string(from: Date())
        let selfString = formatter.string(from: self as Date)
        return nowString == selfString
    }
    // 是否昨天
    public func isYesterDay() -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let nowDate = formatter.date(from: formatter.string(from: Date()))
        let selfDate = formatter .date(from: formatter.string(from: self as Date))
        
        let calender = Calendar.current
        let components = calender.dateComponents([.year, .month, .day], from: selfDate!, to: nowDate!)
        
        return components.year == 0 && components.month == 0 && components.day == 1
        
    }
    
}
