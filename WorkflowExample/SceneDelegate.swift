//
//  SceneDelegate.swift
//  WorkflowExample
//
//  Created by Mary Paskhaver on 8/10/23.
//

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        self.window = window

        let viewController = ViewController()

        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

