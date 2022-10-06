
import Foundation

class TimeStamp {
    
    static let long  = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    
    internal class func convertDateFormatterToCompare(date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let convertedDate = dateFormatter.date(from: date)
        
        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let timeStamp = dateFormatter.string(from: convertedDate!)
        
        return timeStamp
    }
    
}
