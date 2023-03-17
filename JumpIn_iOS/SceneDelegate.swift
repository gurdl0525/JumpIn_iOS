//
//  SceneDelegate.swift
//  JumpIn_iOS
//
//  Created by 이강혁 on 2023/03/17.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        let rootNavigationController = ViewController()
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
    }
}

