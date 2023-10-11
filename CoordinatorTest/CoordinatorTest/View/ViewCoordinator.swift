//
//  ViewCoordinator.swift
//  CoordinatorTest
//
//  Created by 정호진 on 10/9/23.
//

import Foundation
import UIKit

protocol ViewCoordinatorProtocol {
    func didClicked(_ coordinator: ViewCoordinator)
}

final class ViewCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var delegate: ViewCoordinatorProtocol?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        let viewController = ViewController()
        viewController.delegate = self
        viewController.view.backgroundColor = .brown
//        navigationController?.pushViewController(viewController, animated: true)
        navigationController.viewControllers = [viewController]
    }
    
    
}

extension ViewCoordinator: ClickedButtonProtocol {
    func clicked() {
        delegate?.didClicked(self)
    }
}
