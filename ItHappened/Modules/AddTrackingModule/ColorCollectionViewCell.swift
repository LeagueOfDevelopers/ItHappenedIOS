import UIKit

class ColorCollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    private let numberOfColors:[Int:String] = [0:"blue", 1:"pink", 2:"yellow",3:"green", 4:"violet"]
    @IBOutlet var collectionView: UICollectionView!
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.dataSource = self as UICollectionViewDataSource
    }
    
}

extension ColorCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath) as? ColorCollectionCell
        let color: String = numberOfColors[indexPath.row]!
        cell!.checkColor.isHidden = true
        cell!.backgroundColor = UIColor(named: "\(color)")
        cell!.layer.cornerRadius = cell!.frame.height / 2
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ColorCollectionCell
        checkColor(cell: cell!)
    }
    
    func checkColor(cell: ColorCollectionCell){
        for cell in collectionView.visibleCells{
            let cellColor = cell as! ColorCollectionCell
            cellColor.checkColor.isHidden = true
        }
        cell.checkColor.isHidden = false
    }
    
}

class ColorCollectionCell: UICollectionViewCell{
    @IBOutlet var checkColor: UIImageView!
}
