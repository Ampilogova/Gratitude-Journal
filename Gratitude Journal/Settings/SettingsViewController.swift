//
//  SettingsViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    let settings = [
        Setting(name: "notifications"),
        Setting(name: "send.feedback"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = loc("settings")
        createTable()
    }
    
    func createTable() {
        let settingTableView = UITableView(frame: view.bounds, style: .plain)
        settingTableView.delegate = self
        settingTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(settingTableView)
        
        settingTableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.className)
        settingTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.className, for: indexPath) as? SettingsCell else {
            preconditionFailure("SettingsCell can't be dequeued")
        }
        let setting = settings[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.configure(with: setting)
        
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
        }
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
