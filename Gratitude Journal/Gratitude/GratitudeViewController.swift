//
//  GratitudeViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/5/22.
//

import UIKit

class GratitudeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    public func currentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE\nMMMM d, yyyy"
        return dateFormatter.string(from: date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your day"
        view.backgroundColor = .systemBackground
        self.navigationController?.isNavigationBarHidden = true
        setupTableView()
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.separatorStyle = .none
        tableView.register(DateCell.self, forCellReuseIdentifier: DateCell.className)
        tableView.register(GratitudeCell.self, forCellReuseIdentifier: GratitudeCell.className)
        tableView.register(HappyThingsCell.self, forCellReuseIdentifier: HappyThingsCell.className)
        tableView.register(ButtonCell.self, forCellReuseIdentifier: ButtonCell.className)
        tableView.register(MoodCell.self, forCellReuseIdentifier: MoodCell.className)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pinToSuperview()
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DateCell.className, for: indexPath) as! DateCell
            cell.dateLabel.text = currentDate()
            return cell
        
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: GratitudeCell.className, for: indexPath) as! GratitudeCell
            return cell
            
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HappyThingsCell.className, for: indexPath) as! HappyThingsCell
            return cell
            
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MoodCell.className, for: indexPath) as! MoodCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.className, for: indexPath) as! ButtonCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

