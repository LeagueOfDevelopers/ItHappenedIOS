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
    

    let heightForCell = 84
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    let colors = ["blue", "pink", "yellow", "green", "violet","blue", "pink", "yellow", "green", "violet"]

}



extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackingCell", for: indexPath) as? TrackingTableViewCell
        cell?.color.backgroundColor = UIColor(named: colors[indexPath.row])
        cell?.color.layer.cornerRadius = (cell?.color.frame.width)! / 2
        cell?.name.text = "Мое отслеживание"
        cell?.date.text = "Вчера"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(heightForCell)
    }
    
    
}
