//
//  DateManager.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 25/01/2021.
//

import Foundation

class DateManager : NSObject  {
    
    static let shared = DateManager()
    
    func getTime(from date : String) -> String  {
        let formatter = Foundation.DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" //2017-04-01T18:05:00.000
        let date1  = formatter.date(from:  date)
        formatter.dateFormat = "HH:mm"
        let resultTime = formatter.string(from: date1!)
        
        return resultTime
    }
    
    func convertDate(with string : String) -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: string)!
        dateFormatter.dateFormat = "EEE, d MMM"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}
