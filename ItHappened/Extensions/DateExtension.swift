import Foundation

extension Date {
    func convertToLocalTime() -> Date {
        let hours = convertAbbreviate()
        let targetOffset = Double(hours * 3600)
        return self.addingTimeInterval(targetOffset)
    }
    
    func convertAbbreviate() -> Int{
        let UTC = TimeZone.current.abbreviation()!
        if UTC.count == 5{
            return Int(UTC.suffix(1))!
        }
        else {
            return Int(UTC.suffix(2))!
        }
    }
}
