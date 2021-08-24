import UIKit
import Cartography

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var collection2 = { return UILabel(frame: .zero) }()
    private var collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private func buildHierarchy() {
        addSubview(collection)
    }

    private func setupConstraints() {
        constrain(collection) { collection in
            collection.edges == inset(collection.superview!.edges, 16, 16, 16, 16)
        }
    }
    
    private func configureViews() {
        collection.setCollectionViewLayout(UICollectionViewFlowLayout.init(), animated: true)
        collection.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeCollectionCell")
        collection.backgroundColor = .none
        backgroundColor = .systemGray6
    }
    
    private func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func setupCollection(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        collection.dataSource = dataSource
        collection.delegate = delegate
    }
}
