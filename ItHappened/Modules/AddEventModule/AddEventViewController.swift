import UIKit
import Cosmos

class AddEventViewController: UIViewController, AddEventViewProtocol {
    
    //MARK: Properties
    var presenter: AddEventPresenterProtocol?
    let mint = #colorLiteral(red: 0.1568627451, green: 0.7529411765, blue: 0.7450980392, alpha: 1)
    var tracking: Trackings?
    
    //MARK: Outlets
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
        guard let scale = self.scaleTextField.text else {
            return
        }
        presenter?.checkDataForEvent(comment: self.commentTextField.text ?? "", rating: Int(self.starRating.rating), scale: Int(scale) ?? 0, date: self.datePicker.date, tracking: self.tracking!)
        navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        AddEventWireframe.createAddEventModule(addEventRef: self)
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
    
    func showErrorButton() {
        self.doneButton.showErrorButton()
    }
    
    func hideView(view: UIView){
        
    }
    
    func checkTrackingForConditions(){
        if tracking?.scale == "None"{
            self.scaleView.isHidden = true
        }
        if tracking?.comment == "None"{
            self.commentView.isHidden = true
        }
        if tracking?.rating == "None"{
            self.ratingView.isHidden = true
        }
        scaleComment.text = ("Будем измерять в \(tracking!.scaleName!)")
    }
}
