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
    @IBOutlet var addNewTrackingbutton: UIButton!
    let heightForCell = 98
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        addNewTrackingbutton.addTarget(self, action: #selector(goToAddTracking(_:)), for: .touchUpInside)
    }
    
    let colors = ["blue", "pink", "yellow", "green", "violet","blue", "pink", "yellow", "green", "violet"]

    @objc func goToAddTracking(_ sender: UIButton){
        let addTrackingViewController = storyboard?.instantiateViewController(withIdentifier: "addTrackingVC")
        self.present(addTrackingViewController!, animated: true)
    }
    
}



extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackingCell", for: indexPath) as? TrackingTableViewCell
        cell?.color.backgroundColor = UIColor(named: colors[indexPath.row])
        cell?.color.layer.cornerRadius = (cell?.color.frame.height)! / 2
        cell?.name.text = "Мое отслеживание"
        cell?.comment.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        cell?.date.text = "Вчера"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightForCell)
    }
    
    
}
