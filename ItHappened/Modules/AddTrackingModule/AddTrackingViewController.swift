//
//  AddTrackingViewController.swift
//  ItHappened
//
//  Created by Victor on 12/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit

class AddTrackingViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.isPagingEnabled = true
        let flowLayout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing = 0

    }
    
}

extension AddTrackingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rating", for: indexPath) as? RatingCollectionViewCell
            cell?.delegate = self
            return cell!
        }
        if indexPath.item == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scale", for: indexPath)
            return cell
        }
        if indexPath.item == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colors", for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "comment", for: indexPath) as? CommentCollectionViewCell
        cell?.delegate = self
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollMenuAtIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
}

extension AddTrackingViewController: CellDelegate {
    func goToStep(step: Int) {
        scrollMenuAtIndex(menuIndex: step)
    }
    func didCompleteOnboarding() {
        self.dismiss(animated: true, completion: nil)
    }
}
