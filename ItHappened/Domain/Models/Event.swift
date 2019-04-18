import Foundation
class Event{
    //MARK: Initialization
    var eventId : Int
    var trackingId : Int
    var dateOfChange : Date
    var scale : Int
    var rating : Int
    var comment : String
    var isDeleted : Bool?
    
    init(eventId : Int, trackingId: Int, date: Date, scale : Int,
         rating: Int, comment : String, isDeleted: Bool = false){
        self.eventId = eventId
        self.trackingId = trackingId
        self.dateOfChange = date
        self.scale = scale
        self.rating = rating
        self.comment = comment
        self.isDeleted = isDeleted
    }
    
    //MARK: Functions
    func getStringDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let stringDate = dateFormatter.string(from: self.dateOfChange)
        return stringDate
    }
    func editDate(eventDate : Date){
        self.dateOfChange = Date()
    }
    func editScale(scale : Int){
        self.scale = scale
        self.dateOfChange = Date()
    }
    func editValueOfRating(rating: Int){
        self.rating = rating
        self.dateOfChange = Date()
    }
    func editComment(comment : String){
        self.comment = comment
        self.dateOfChange = Date()
    }
    func removeEvent(){
        self.isDeleted = true
        self.dateOfChange = Date()
    }
    func getEventDate() -> Date {
        return self.dateOfChange
    }
    func setEventDate(date: Date){
        self.dateOfChange = date
    }
    func getEventId() -> Int{
        return self.eventId
    }
    func setEventId(uuid: Int){
        self.eventId = uuid
    }
    func getScale() -> Int{
        return self.scale
    }
    func setScale(scale : Int){
        self.scale = scale
    }
    func getRating() -> Int{
        return self.rating
    }
    func setRating(rating : Int){
        self.rating = rating
    }
    func getComment() -> String{
        return self.comment
    }
    func setComment(comment : String){
        self.comment = comment
    }
    func getTrackingId() -> Int{
        return self.trackingId
    }
    func setTrackingId(uuid : Int){
        self.trackingId = uuid
    }
    func returnStatus() -> Bool?{
        return self.isDeleted
    }
    func setStatus(status : Bool){
        self.isDeleted = status
    }
    
    
}
