
//  Created by SwiftyHelpKit on 8/16/18.
//  Copyright © 2018 SwiftyHelpKit. All rights reserved.
//

import Foundation

let kServerDateFormat = "yyyy-MM-dd HH:mm:ss"
let klocalizedTimeFormat  = "hh:mm aa"
let klocalizedDateFormat  = "MMM dd"
let klocalizedDateTimeFormat  = "MMM dd HH:mm:ss"
let kDateFormat  = "yyyy-MM-dd"
let kDateFormatForMsg  = "MM/dd/yy"
let kDateFormatForDOB  = "dd/MM/yyyy"
let kNewDateFormatForDOB  = "dd/MM/yy"
let kDateMonthFormate  = "yyyy-MM-dd  HH:mm:ss"
let ktimeFormat = "HH:mm:ss"
let kDateTimeFormat =  "MM-dd-yyyy hh:mm a"
let kDate_GMT_FORMAT = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
let kDate_WALLET_DATE_FORMATE = "MMMM d, y"
let kDateForNotificationScreen  = "h:mm aa, MMMM d"

class SHKDateConvertor: NSObject {
    
    ///get the string from date.
    ///returns :- String of date
    class  func getStringFromDate(date:NSDate, dateFormat:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        //        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.timeZone = NSTimeZone.local
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
    
    /// get the date from string
    ///returns the date
    class  func  getDateFromString(dateText:String,dateFormat:String) -> NSDate {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = NSTimeZone.local
        //        NSTimeZone(name: "UTC") as TimeZone!
        //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        //        let string = "10-12-2016 11:45:22 +0000"
        let date = dateFormatter.date(from: dateText)
        return date! as NSDate
}
}
