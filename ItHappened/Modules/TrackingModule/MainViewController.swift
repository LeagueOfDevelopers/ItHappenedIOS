//
//  MainViewController.swift
//  ItHappened
//
//  Created by Victor on 10/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit

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
    let heightForCell = 70
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
        let db = Database()
        db.createTable()
        self.trackings = db.queryAllRows()
    }
    
}



extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackingCell", for: indexPath) as? TrackingTableViewCell
        cell?.color.backgroundColor = UIColor(named: trackings[indexPath.row].color)
        cell?.color.layer.cornerRadius = (cell?.color.frame.width)! / 2
        cell?.name.text = trackings[indexPath.row].trackingName
        
        cell?.date.text = trackings[indexPath.row].dateOfChange.datatypeValue
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
