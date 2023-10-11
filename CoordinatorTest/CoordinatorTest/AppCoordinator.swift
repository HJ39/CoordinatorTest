//
//  AppCoordinator.swift
//  CoordinatorTest
//
//  Created by 정호진 on 10/9/23.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isLoggedIn {
//            showMainViewController()
        } else {
            showViewController()
        }
    }
    
    private func showViewController() {
        let viewCoordinator = ViewCoordinator(navigationController: navigationController)
        viewCoordinator.delegate = self
        viewCoordinator.start()
        childCoordinators.append(viewCoordinator)
    }
    
    private func showMainViewController() {
        let vc = MainCoordinator(navigationController: navigationController)
        vc.delegate = self
        vc.start()
        childCoordinators.append(vc)
    }
}

extension AppCoordinator: ViewCoordinatorProtocol {
    func didClicked(_ coordinator: ViewCoordinator) {
        print(#function)
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showMainViewController()
    }
}

extension AppCoordinator: MainCoordinatorProtocol {
    func clicked(coordinator: MainCoordinator) {
        print(#function)
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showViewController()
    }
}
