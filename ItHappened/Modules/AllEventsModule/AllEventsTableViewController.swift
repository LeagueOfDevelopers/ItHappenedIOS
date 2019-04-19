import UIKit

class AllEventsTableViewController: UITableViewController {

    var fetchedResultsController = CoreDataManager.instance.fetchedResultsController(entityName: "Events", keyForSort: "date", ascending: false)
    var events:[Events] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func convertToString(date: NSDate) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd hh:mm:ss"
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            try fetchedResultsController.performFetch()
            events = fetchedResultsController.fetchedObjects as! [Events]
        } catch {
            print(error)
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventTableViewCell
        cell?.colorOfTracking.layer.cornerRadius = (cell?.colorOfTracking.frame.width)! / 2
        cell?.nameOfTracking.text = events[indexPath.row].tracking?.name
        cell?.colorOfTracking.backgroundColor = UIColor(named: "\(events[indexPath.row].tracking!.color!)")
        cell?.scaleEvent.text = "\(events[indexPath.row].scale) \(events[indexPath.row].tracking!.scaleName!)"
        cell?.dateOfEvent.text = convertToString(date: events[indexPath.row].date!)
        cell?.ratingEvent.text = String(events[indexPath.row].rating)
        return cell!
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
