//
//  SettingsViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    let gratitudeService = GratitudeService()
    
    let settings = [
        Setting(title: loc("notifications"), icon: UIImage(systemName: "bell.square.fill")!),
        Setting(title: loc("send.feedback"), icon: UIImage(systemName: "envelope.fill")!),
        Setting(title: loc("log.out"), icon: UIImage(systemName: "arrowshape.turn.up.right.fill")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        createTable()
    }
    
    func createTable() {
        let settingTableView = UITableView(frame: view.bounds, style: .plain)
        settingTableView.delegate = self
        settingTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(settingTableView)
        
        settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
        settingTableView.dataSource = self
        
        settingTableView.separatorStyle = .none
    }
    
    private func setupNavigationBar() {
         self.title = loc("settings")
         navigationItem.largeTitleDisplayMode = .automatic
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className, for: indexPath)
          let setting = settings[indexPath.row]
          var configuration = cell.defaultContentConfiguration()
          configuration.text = setting.title
          configuration.image = setting.icon
          configuration.imageProperties.tintColor = .systemPurple

          cell.accessoryType = .disclosureIndicator
          cell.contentConfiguration = configuration
          
          return cell
     }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var viewController = UIViewController()
        if indexPath.row == 0 {
            viewController = NotificationViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        } else if indexPath.row == 1 {
            showMailComposer()
        } else if indexPath.row == 2 {
            gratitudeService.logoutUser()
            self.tabBarController?.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    private func tableView(tableView: UITableView, heightForRowAt indexPath: NSIndexPath) -> CGFloat {
        return 100.0 
    }
    
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            print("Mail services are not available")
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["tampilogova@icloud.com"])
        composer.setSubject("Gratitude Journal feedback")
        composer.setMessageBody("Hi!", isHTML: false)
        
        self.present(composer, animated: true)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
