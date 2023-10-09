//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by 정호진 on 10/9/23.
//

import Foundation
import UIKit

protocol MainCoordinatorProtocol {
    func clicked(coordinator: MainCoordinator)
}

final class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    private var navigationController: UINavigationController
    var delegate: MainCoordinatorProtocol?
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let viewController = MainController()
        viewController.view.backgroundColor = .cyan
        viewController.delegate = self
//        navigationController.viewControllers = [viewController]
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
extension MainCoordinator: MainControllerProtocol{
    func clicked() {
        delegate?.clicked(coordinator: self)
    }
    
}
