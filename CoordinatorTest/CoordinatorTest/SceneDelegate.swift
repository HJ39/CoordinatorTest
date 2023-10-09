//
//  SceneDelegate.swift
//  CoordinatorTest
//
//  Created by 정호진 on 10/9/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let nc = UINavigationController()
        window?.rootViewController = nc
        
        let coordinator = AppCoordinator(navigationController: nc)
        coordinator.start()
        window?.makeKeyAndVisible()
    }
}

