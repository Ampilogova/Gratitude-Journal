//
//  TabBar.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/6/22.
//

import UIKit

class TabBar: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.tintColor = UIColor.customBackgroundColor
        tabBar.backgroundColor = .white
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabbar()
    }
    
    public func setupTabbar() {
        let gratitudeJournal = UINavigationController(rootViewController: GratitudeJournalTableViewController())
        let gratitudeJournalIcon = UITabBarItem(title: loc("journal"), image: UIImage(systemName: "book"), tag: 0)
        gratitudeJournal.tabBarItem = gratitudeJournalIcon
        
        let quotes = QuoteViewController()
        let quotesIcon = UITabBarItem(title: loc("quotes"), image: UIImage(systemName: "list.dash"), tag: 2)
        quotes.tabBarItem = quotesIcon
        
        let settings = UINavigationController(rootViewController: SettingsViewController())
        let settingsIcon = UITabBarItem(title: loc("settings"), image: UIImage(systemName: "gear"), tag: 3)
        settings.tabBarItem = settingsIcon
        
        let controllers = [gratitudeJournal, quotes, settings]
        self.viewControllers = controllers
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}
