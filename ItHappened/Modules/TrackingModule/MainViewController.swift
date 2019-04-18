//
//  MainViewController.swift
//  ItHappened
//
//  Created by Victor on 10/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBAction func addNewTracking(_ sender: Any) {
        let addTrackingViewController = storyboard?.instantiateViewController(withIdentifier: "addTrackingVC")
        self.present(addTrackingViewController!, animated: true)
    }
    var trackings:[Tracking] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var fetchedResultsController = CoreDataManager.instance.fetchedResultsController(entityName: "Trackings", keyForSort: "name")
    let heightForCell = 70
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        self.navigationItem.backBarButtonItem = backItem
//        let context = CoreDataManager.instance.persistentContainer.viewContext
//        let tracking = Trackings(context: context)
//        tracking.id = UUID()
//        tracking.name = "Tracking name with event"
//        tracking.color = "#0000F0"
//        tracking.wasDeleted = false
//        tracking.date = Date() as NSDate
//        let event = Events(context: context)
//        event.id = UUID()
//        event.wasDeleted = false
//        event.date = Date() as NSDate
//        tracking.addToEvent(event)
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
        
        
        CoreDataManager.instance.saveContext()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        let db = Database()
//        db.createTrackingTable()
//        let trackings = db.queryAllRows()
//        self.trackings = db.queryAllRows()
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
//        cell?.color.backgroundColor = UIColor(named: trackings[indexPath.row].color)
        cell?.color.backgroundColor = UIColor(named: "#2FC961")
        let tracking = fetchedResultsController.object(at: indexPath) as? Trackings
        cell?.color.layer.cornerRadius = (cell?.color.frame.width)! / 2
        cell?.name.text = tracking?.name
        cell?.date.text = "Now"
//        cell?.date.text = trackings[indexPath.row].dateOfChange.datatypeValue
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
