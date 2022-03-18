//
//  TabBar.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/6/22.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = UIColor.customBlue
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: GratitudeViewController(), image: UIImage(systemName: "house.fill")!),
            createNavController(for: HistoryViewController(), image: UIImage(systemName: "calendar")!),
            createNavController(for: SettingsViewController(), image: UIImage(systemName: "gearshape")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
