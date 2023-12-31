//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by 정호진 on 10/9/23.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var childCoordinators : [Coordinator] { get set }
    var navigationController: UINavigationController {get set}
    func start()
}
