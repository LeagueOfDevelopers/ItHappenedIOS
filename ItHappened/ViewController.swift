import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var statButton: UIButton!
    @IBOutlet var historyButton: UIButton!
    
    @IBAction func mainClick(_ sender: Any) {
        scrollMenuAtIndex(menuIndex: 0)}
    
    @IBAction func historyClick(_ sender: Any) {
        scrollMenuAtIndex(menuIndex: 2)}
    
    @IBAction func statClick(_ sender: Any) {
        scrollMenuAtIndex(menuIndex: 1)}
    
    public let fab : UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 80, y: UIScreen.main.bounds.height - 80, width: 60, height: 60))
        button.setImage(UIImage(named: "addButton"), for: .normal)
        return button
    }()
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.isPagingEnabled = true
        let flowLayout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing = 0
        view.addSubview(fab)

        fab.addTarget(self, action: #selector(goToAddTracking(_:)), for: .touchUpInside)
        //        collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    @objc func goToAddTracking(_ sender: UIButton){
        let addTracking = storyboard?.instantiateViewController(withIdentifier: "addTracking")
        present(addTracking!, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        switch scrollView.contentOffset.x {
        case 0.0:
            mainButton.setImage(UIImage(named: "main_selected"), for: UIControl.State())
            statButton.setImage(UIImage(named: "stat"), for: UIControl.State())
            historyButton.setImage(UIImage(named: "history"), for: UIControl.State())
        case scrollView.contentSize.width / 3:
            statButton.setImage(UIImage(named: "stat_selected"), for: UIControl.State())
            mainButton.setImage(UIImage(named: "main"), for: UIControl.State())
            historyButton.setImage(UIImage(named: "history"), for: UIControl.State())
        case scrollView.contentSize.width / 3 * 2:
            historyButton.setImage(UIImage(named: "history_selected"), for: UIControl.State())
            mainButton.setImage(UIImage(named: "main"), for: UIControl.State())
            statButton.setImage(UIImage(named: "stat"), for: UIControl.State())
        default:
            print()
        }
    }
    
    
    func scrollMenuAtIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageId", for: indexPath)
            return cell
        }
        if indexPath.item == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labelId", for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        //        cell.addSubview(fab)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}



class CustomCell: UITableViewCell{
    @IBOutlet var color: UIImageView!
    @IBOutlet var oval: UIImageView!
    @IBOutlet var tracking: UILabel!
    @IBOutlet var secondColor: UIImageView!
}

let colors : [String] = ["red", "pink", "purple", "blue", "green", "khaki", "orange", "red", "pink", "purple", "blue", "green", "khaki", "orange"]


class CustomCollectionCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet var tableView: UITableView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.dataSource = self
        tableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.tracking.text = "Мое отслеживание"
        let color = colors[indexPath.row]
        var secondColor = "white"
        if indexPath.row < colors.count-1 {
            secondColor = colors [indexPath.row + 1]}
        cell.color?.backgroundColor = UIColor(named: "\(color)")
        cell.secondColor?.backgroundColor = UIColor(named: "\(secondColor)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
