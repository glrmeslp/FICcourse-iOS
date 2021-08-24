import UIKit

class ApplicationCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let window: UIWindow
    private var homeCoordinator: HomeCoordinator?

    init(window: UIWindow) {
        self.window = window

        navigationController = UINavigationController()
//        navigationController.navigationBar.prefersLargeTitles = true

        homeCoordinator = HomeCoordinator(navigationController: navigationController)
    }

    func start() {
        window.rootViewController = navigationController
        homeCoordinator?.start()
        window.makeKeyAndVisible()
    }

}
