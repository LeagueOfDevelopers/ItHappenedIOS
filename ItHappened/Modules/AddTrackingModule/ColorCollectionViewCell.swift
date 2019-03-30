import UIKit

class ColorCollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    private let numberOfColors:[String] = ["#4BA6EC","#FF528F","#975D99","#F8DB3B","#28C0BE","#FEACA1","#2FC961","#FE765D","#FFC562","#47ACD7","#6DCEF9","#DD3DAA"]
    @IBOutlet var collectionView: UICollectionView!
    
    weak var delegate: colorPickDelegate?
    
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
        let color: String = numberOfColors[indexPath.row]
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
        delegate?.getColor(color: numberOfColors[indexPath.row])
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

protocol colorPickDelegate: class{
    func getColor(color: String)
}

class ColorCollectionCell: UICollectionViewCell{
    @IBOutlet var checkColor: UIImageView!
}
