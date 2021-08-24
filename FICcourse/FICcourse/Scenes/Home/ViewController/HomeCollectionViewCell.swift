import UIKit

protocol HomeCollectionViewCellDelegate {
    func configure(with data: HomeCollectionViewCell.ViewModel, and view: UICollectionViewCell)
}

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var titleLabel: UILabel?
    
    struct ViewModel {
        let title: String
    }
}

extension HomeCollectionViewCell: HomeCollectionViewCellDelegate {
    func configure(with data: ViewModel, and view: UICollectionViewCell) {
        titleLabel?.text = data.title
        
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "systemGreenColor")?.cgColor
    }
}
