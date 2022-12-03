//
//  DateExtension.swift
//  BirthdayReminderDev
//
//  Created by Kartum Infotech on 14/10/21.
//

import Foundation
extension String {
    func dateForBirthday() -> Date {
        let arrComponents = self.components(separatedBy: "/")
        if arrComponents.count >= 2, let month = Int(arrComponents[1]), let days = Int(arrComponents[0]) {
            
            let calendar = Calendar.current
            DLog("month = \(month) days = \(days)")
            let birthDateCoponents = DateComponents(month: month, day: days)
            if let nextBirthDate = calendar.nextDate(after: Date(), matching: birthDateCoponents, matchingPolicy: .nextTime) {
                return nextBirthDate
            }
            return birthDateCoponents.date ?? Date()
        }
        
        return Date()
    }
    
    func formattedDateToShow() -> String {
        if self == "" {
            return ""
        } else {
            let date = self.getDateWithFormate(formate: "dd/MM/yyyy", timezone: TimeZone.current.abbreviation()!)
            return date.getDateStringWithFormate("dd MMM yyyy", timezone: TimeZone.current.abbreviation()!)
        }
    }
    
    //https://stackoverflow.com/questions/53992129/how-to-calculate-days-hours-minutes-from-now-to-certain-date-in-swift
    func getDaysLeft() -> Int? {
        let arrComponents = self.components(separatedBy: "/")
        if arrComponents.count >= 2, let month = Int(arrComponents[1]), let days = Int(arrComponents[0]) {
            
            let birthDateCoponents = DateComponents(month: month, day: days)
            let nextBirthDate = Calendar.current.nextDate(after: Date(), matching: birthDateCoponents, matchingPolicy: .nextTime)!

            let difference = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: nextBirthDate)
            return difference.day
        }
        return nil
    }
    
    func isDayAndMonthToday() -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        let formattedDate = dateFormatter.string(from: Date())
        return self.hasPrefix(formattedDate)
    }
}

extension Date {
    func formattedDateToShow() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YYYY"
        return dateFormatter.string(from: self)
    }
}
