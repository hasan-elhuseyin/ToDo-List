//
//  SceneDelegate.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        self.window = appContainer.router.start(scene: windowScene)
    }
}

