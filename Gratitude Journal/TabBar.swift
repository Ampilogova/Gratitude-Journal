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
        tabBar.tintColor = UIColor.customBackgroundColor
        tabBar.backgroundColor = .white
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: GratitudeJournalTableViewController(), image: UIImage(systemName: "book")!, title: "Journal"),
            createNavController(for: CreateNoteViewController(), image: UIImage(systemName: "square.and.pencil")!, title: "Add note"),
            createNavController(for: QuoteViewController(), image: UIImage(systemName: "list.dash")!, title: "Quotes"),
            createNavController(for: SettingsViewController(), image: UIImage(systemName: "gear")!, title: "Settings")
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         image: UIImage, title: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.tabBarItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
