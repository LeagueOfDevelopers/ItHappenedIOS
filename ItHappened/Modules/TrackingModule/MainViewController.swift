import UIKit
import CoreData
import SwiftDate

class MainViewController: UIViewController {
    //MARK: Outlets and properties
    let heightForCell = 70
    @IBOutlet var tableView: UITableView!
    @IBAction func addNewTracking(_ sender: Any) {
        let addTrackingViewController = storyboard?.instantiateViewController(withIdentifier: "addTrackingVC")
        self.present(addTrackingViewController!, animated: true)
    }
    var fetchedResultsController = CoreDataManager.instance.fetchedResultsController(entityName: "Trackings", keyForSort: "name", ascending: true)
    var trackings:[Trackings] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func convertToString(date: NSDate) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let date = date as Date
        if date.isToday{
            return "Сегодня"
        }
        if date.isYesterday{
            return "Вчера"
        }
        let dateFromNSDate = dateFormatter.string(from: date as Date)
        return dateFromNSDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        self.navigationItem.backBarButtonItem = backItem
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            try fetchedResultsController.performFetch()
            trackings = fetchedResultsController.fetchedObjects as! [Trackings]
        } catch {
            print(error)
        }
    }
    
}



extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackingCell", for: indexPath) as? TrackingTableViewCell
        let tracking = fetchedResultsController.object(at: indexPath) as? Trackings
//        print("THISHAIHIDHFIDS      \(tracking?.event?.allObjects.count)")
        cell?.color.backgroundColor = UIColor(named: "\(tracking!.color!)")
        cell?.color.layer.cornerRadius = (cell?.color.frame.width)! / 2
        cell?.name.text = tracking?.name
        cell?.date.text = convertToString(date: (tracking?.date)!)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let add = UIContextualAction(style: .normal, title: "Добавить  событие") { (action, view, nil) in
            let addEventViewController = self.storyboard?.instantiateViewController(withIdentifier: "addEvent") as! AddEventViewController
            let tracking = self.trackings[indexPath.row]
            addEventViewController.tracking = tracking
            self.navigationController?.pushViewController(addEventViewController, animated: true)
        }
        add.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.7529411765, blue: 0.7450980392, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [add])
    }
    
}

extension MainViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightForCell)
    }
    
}
