import UIKit

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
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor,constant: 16),
            collection.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            collection.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            collection.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor)
        ])
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
