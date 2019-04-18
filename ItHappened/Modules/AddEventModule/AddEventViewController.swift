import UIKit
import Cosmos

class AddEventViewController: UIViewController {
    @IBOutlet var scaleComment: UILabel!
    @IBOutlet var scaleView: UIView!
    @IBOutlet var ratingView: UIView!
    @IBOutlet var commentView: UIView!
    @IBOutlet var commentTextField: UITextView!
    @IBOutlet var starRating: CosmosView!
    @IBOutlet var scaleTextField: UITextField!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBAction func doneButtonTapped(_ sender: Any) {
        let database = Database()
        database.createTrackingTable()
        database.createEventTable()
        database.insertEvent(event: createEvent(), idOfTracking: (self.tracking?.id)!)
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    let mint = UIColor(displayP3Red: 40.0/255, green: 192.0/255, blue: 190.0/255, alpha: 1)
    var tracking: Tracking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTrackingForConditions()
        getMintBorders(view: commentTextField)
        getMintBorders(view: scaleTextField)
        getRoundBorders()
    }
    func getMintBorders(view: AnyObject){
        view.layer.cornerRadius = 4
        view.layer.borderColor = mint.cgColor
        view.layer.borderWidth = 1
    }
    func getRoundBorders(){
        doneButton.backgroundColor = mint
        doneButton.layer.cornerRadius = doneButton.frame.height / 2
    }
    
    func checkTrackingForConditions(){
        if tracking?.scale == .None{
            self.scaleView.isHidden = true
        }
        if tracking?.comment == .None{
            self.commentView.isHidden = true
        }
        if tracking?.rating == .None{
            self.ratingView.isHidden = true
        }
        else{
            scaleComment.text = ("Будем измерять в \(tracking!.scaleName)")
        }
    }
    func createEvent() -> Event{
        let date = datePicker.date
        let comment = commentTextField.text
        let rating = Int(starRating.rating)
        let scale = Int(scaleTextField.text!)
        let event = Event(eventId: 0, trackingId: 0, date: date, scale: scale ?? 0, rating: rating, comment: comment ?? "none")
        return event
    }
}
