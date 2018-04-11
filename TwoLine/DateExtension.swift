//
//  DateExtension.swift
//  
//
//  Created by 麻生昌志 on 2018/04/11.
//

import UIKit


extension Date {
    func offsetFrom() -> String {
        if yearsFrom()   > 0 { return "\(yearsFrom())年"   }
        if monthsFrom()  > 0 { return "\(monthsFrom())ヶ月"  }
        if weeksFrom()   > 0 { return "\(weeksFrom())週間"   }
        if daysFrom()    > 0 { return "\(daysFrom())日"    }
        if hoursFrom()   > 0 { return "\(hoursFrom())時間"   }
        if minutesFrom() > 0 { return "\(minutesFrom())分" }
        if secondsFrom() > 0 { return "\(secondsFrom())秒" }
        return ""
    }
    
    func yearsFrom() -> Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year ?? 0
    }
    func monthsFrom() -> Int {
        return Calendar.current.dateComponents([.month], from: self, to: Date()).month ?? 0
    }
    func weeksFrom() -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
    }
    func daysFrom() -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
    }
    func hoursFrom() -> Int {
        return Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
    }
    func minutesFrom() -> Int {
        return Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
    }
    func secondsFrom() -> Int {
        return Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
    }
    
    
}
