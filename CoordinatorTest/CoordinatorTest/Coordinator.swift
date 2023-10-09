//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by 정호진 on 10/9/23.
//

import Foundation

protocol Coordinator : AnyObject {
    var childCoordinators : [Coordinator] { get set }
    func start()
}
