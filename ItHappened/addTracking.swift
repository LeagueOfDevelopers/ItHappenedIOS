//
//  addTracking.swift
//  ItHappened
//
//  Created by Victor on 08/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit

class addTracking: UIViewController {
    @IBOutlet var backButton: UIButton!
    @IBOutlet var createButton: UIButton!
    @IBOutlet var inputAmount: UITextField!
    @IBOutlet var nameTrackingView: UITextField!
    @IBOutlet var colorsCollectionView: UICollectionView!
    @IBAction func ratingSC(_ sender: CustomSegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Selected 1 item")
        case 1:
            print("Selected 2 item")
        case 2:
            print("Selected 3 item")
        default:
            print("Default action")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.addTarget(self, action: #selector(goToMainScreen(_:)), for: .touchUpInside)
        createButton.layer.cornerRadius = createButton.frame.height / 2
        colorsCollectionView.delegate = self as! UICollectionViewDelegate
        colorsCollectionView.dataSource = self as! UICollectionViewDataSource
        nameTrackingView.layer.shadowColor = UIColor.black.cgColor
        nameTrackingView.layer.shadowOpacity = 10
        nameTrackingView.layer.shadowOffset = CGSize(width: 10, height: 10)
        nameTrackingView.layer.shadowRadius = 10
        inputAmount.layer.cornerRadius = inputAmount.frame.height / 2
        inputAmount.layer.masksToBounds = true
        inputAmount.layer.borderWidth = 1
        inputAmount.layer.borderColor = UIColor.lightGray.cgColor
        // Do any additional setup after loading the view.
    }
    
    @objc func goToMainScreen(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    
    
}


extension addTracking: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "color", for: indexPath)
        cell.backgroundColor = .red
        cell.layer.cornerRadius = cell.frame.height / 2
        return cell
    }
    
    
}
