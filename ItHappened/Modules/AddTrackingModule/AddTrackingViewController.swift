import UIKit

class AddTrackingViewController: UIViewController, UICollectionViewDelegateFlowLayout, AddTrackingViewProtocol {
    func showErrorButton() {
        UIView.animate(withDuration: 0.3) {
            self.nextButton.backgroundColor = UIColor(displayP3Red: 255.0/255, green: 221.0/255, blue: 100.0/255, alpha: 1)
        }
        UIView.animate(withDuration: 0.3) {
            self.nextButton.backgroundColor = UIColor(displayP3Red: 40.0/255, green: 192.0/255, blue: 190.0/255, alpha: 1)
        }
        self.index -= 1
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func changeNextButton(doneLabel: Bool, otherViews: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.doneLabel.isHidden = doneLabel
            self.pageController.isHidden = otherViews
            self.nextLabel.isHidden = otherViews
            self.nextImageView.isHidden = otherViews
        }
    }
    
    func togglePreviousButton(toggle: Bool) {
        previousButton.isHidden = toggle
    }
    
    func goToPage(index: Int) {
        scrollMenuAtIndex(menuIndex: index)
        pageController.currentPage = index
    }
    

    //MARK: Properties
    var presenter: AddTrackingPresenterProtocol?
    var wireframe: AddTrackingWireframeProtocol?
    private var index = 0
    private let numberOfItemsSections = 5
    private var name: String?
    @IBOutlet var nextLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var doneLabel: UILabel!
    @IBOutlet var nextImageView: UIImageView!
    @IBAction func dismissButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func previousButtonAction(_ sender: Any) {
        self.index -= 1
        presenter?.goToPreviousPage(index: self.index)
    }
    @IBOutlet var previousButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var pageController: UIPageControl!
    @IBAction func nextButton(_ sender: Any) {
        self.index += 1
        presenter?.goToNextPage(index: self.index)
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        AddTrackingWireframe.createAddTrackingModule(addTrackingRef: self)
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.isPagingEnabled = true
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        let flowLayout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing = 0

    }
}

extension AddTrackingViewController: UICollectionViewDelegate, UICollectionViewDataSource, cellNameDelegate, indexFromSControlDelegate, colorPickDelegate{
    func getName(name: String) {
        self.presenter?.getUserData(data: name, for: "name")
    }
    
    func getValueFromComment(_ value: Int) {
        presenter?.getUserData(data: value, for: "comment")
    }
    
    func getValueFromRating(_ value: Int) {
        presenter?.getUserData(data: value, for: "rating")
    }
    
    func getValueFromScale(_ value: Int, scaleName: String) {
        print("scale is \(value) and scaleName is \(scaleName)")
        presenter?.getUserData(data: value, for: "scale")
        presenter?.getUserData(data: scaleName, for: "scaleName")
    }
    
    func getColor(color: String) {
        presenter?.getUserData(data: color, for: "color")
    }
    
    
    func checkTextFields() -> Bool{
        if self.name!.isEmpty {
            return false
        }
        return true
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "comment", for: indexPath) as! CommentCollectionViewCell
            cell.delegate = self as? indexFromSControlDelegate
            return cell
        }
        if indexPath.item == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rating", for: indexPath) as! RatingCollectionViewCell
            cell.delegate = self as? indexFromSControlDelegate
            return cell
        }
        if indexPath.item == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scale", for: indexPath) as! ScaleCollectionViewCell
            cell.delegate = self as? indexFromSControlDelegate
            return cell
        }
        if indexPath.item == 4{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colors", for: indexPath) as! ColorCollectionViewCell
            cell.delegate = self as? colorPickDelegate
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "name", for: indexPath) as! NameCollectionViewCell
        cell.delegate = self as? cellNameDelegate
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollMenuAtIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
}
