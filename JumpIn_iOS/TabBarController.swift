//
//  TabBarController.swift
//  JumpIn_iOS
//
//  Created by 이강혁 on 2023/05/10.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewContoller = UINavigationController(rootViewController: StreamViewController())
        homeViewContoller.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "home"),
            selectedImage: UIImage(named: "home")
        )
        
        let shortsViewController = UINavigationController(rootViewController: UIViewController())
        shortsViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "shorts"),
            selectedImage: UIImage(named: "shorts"))
        
        let plusViewController = UINavigationController(rootViewController: UIViewController())
        plusViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "plus.circle"),
            selectedImage: UIImage(systemName: "plus.circle"))
        
        let subscribeViewController = UINavigationController(rootViewController: UIViewController())
        subscribeViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "subscribe"),
            selectedImage: UIImage(named: "subscribe")
        )
        
        let storageViewController = UINavigationController(rootViewController: UIViewController())
        storageViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "storage"),
            selectedImage: UIImage(named: "storage")
        )
        
        viewControllers = [homeViewContoller, shortsViewController, plusViewController, subscribeViewController, storageViewController]
    }
}
