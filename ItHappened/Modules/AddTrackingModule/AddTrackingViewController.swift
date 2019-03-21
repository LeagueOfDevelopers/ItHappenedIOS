import UIKit

class AddTrackingViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    private var index = 0
    private let numberOfItemsSections = 5
    private var name: String = ""
    private var descriptionOfTracking: String = ""
    @IBOutlet var nextLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var doneLabel: UILabel!
    @IBOutlet var nextImageView: UIImageView!
    @IBAction func dismissButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func previousButtonAction(_ sender: Any) {
        index -= 1
        if index >= 0{
            scrollMenuAtIndex(menuIndex: index)
            pageController.currentPage = index
        }
        if index > 0{
            previousButton.isHidden = false
        }
        else{
            previousButton.isHidden = true
        }
        if index == 3{
            self.doneLabel.isHidden = true
            self.pageController.isHidden = false
            self.nextLabel.isHidden = false
            self.nextImageView.isHidden = false
        }
        
    }
    @IBOutlet var previousButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var pageController: UIPageControl!
    @IBAction func nextButton(_ sender: Any) {
        if checkTextFields(){
            index += 1
        }
        if index < numberOfItemsSections{
            scrollMenuAtIndex(menuIndex: index)
            pageController.currentPage = index
        }
        if index > 0{
            previousButton.isHidden = false
        }
        else{
            previousButton.isHidden = true
        }
        if index == 4{
            UIView.animate(withDuration: 0.3) {
                self.doneLabel.isHidden = false
                self.pageController.isHidden = true
                self.nextLabel.isHidden = true
                self.nextImageView.isHidden = true
            }
        }
        if index > 4{
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.isPagingEnabled = true
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        let flowLayout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing = 0

    }
    
}

extension AddTrackingViewController: UICollectionViewDelegate, UICollectionViewDataSource, cellNameDelegate {
    func getNameAndDescription(name: String, description: String) {
        self.name = name
        self.descriptionOfTracking = description
    }
    func checkTextFields() -> Bool{
        if self.name.isEmpty || self.descriptionOfTracking.isEmpty{
            return false
        }
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "comment", for: indexPath)
            return cell
        }
        if indexPath.item == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rating", for: indexPath)
            return cell
        }
        if indexPath.item == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scale", for: indexPath)
            return cell
        }
        if indexPath.item == 4{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colors", for: indexPath)
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
