import UIKit

class HomeViewController: UIViewController {
    
    private var menu: [String]?
    private var viewModel: HomeViewModel?
    
    init(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        nil
    }

    private var customView: HomeView {
        return view as! HomeView
    }

    override func loadView() {
        let homeView = HomeView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        customView.setupCollection(dataSource: self, delegate: self)
        fethData()
    }
    
    private func fethData() {
        menu = viewModel?.fethData()
    }
}

extension HomeViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menu?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionCell", for: indexPath) as? HomeCollectionViewCell,
              let menu = menu?[indexPath.row] else { return UICollectionViewCell() }
        cell.configure(with: .init(title: menu),and: cell)

        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let orientation = UIDevice.current.orientation
        if orientation == .portrait {
            let width = collectionView.bounds.width / 2 - 8
            return CGSize(width: width, height: width)
        }
        
        let width = collectionView.bounds.width / 4 - 2
        return CGSize(width: width, height: width)
    }
}
