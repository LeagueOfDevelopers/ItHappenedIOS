//
//  AddTrackingCollectionViewController.swift
//  ItHappened
//
//  Created by Victor on 10/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class AddTrackingCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.isPagingEnabled = true
        let flowLayout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing = 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rating", for: indexPath)
            cell.backgroundColor = .red
            return cell
        }
        if indexPath.item == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scale", for: indexPath)
            cell.backgroundColor = .purple
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
    
    func scrollMenuAtIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}

extension AddTrackingCollectionViewController: CellDelegate {
    func goToStep(step: Int) {
        scrollMenuAtIndex(menuIndex: step)
    }
    func didCompleteOnboarding() {
        self.dismiss(animated: true, completion: nil)
    }
}

