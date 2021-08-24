import UIKit

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeViewModel()
        let homeViewController = HomeViewController(with: viewModel)
        navigationController.pushViewController(homeViewController, animated: false)
    }
}
