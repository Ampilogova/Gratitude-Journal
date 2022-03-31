//
//  NotificationViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import UIKit

class NotificationViewController: UIViewController, DateCollectionViewDelegate  {
    
    var dateCollectionView = DateCollectionView()
    private let notificationService = NotificationService()
    private var days = [Int]()
    
    private let timeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = loc("time")
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .customblackColor
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let timeSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = loc("morning")
        label.font = .systemFont(ofSize: 17)
        label.textColor = .customGrayColor
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = loc("day")
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .customblackColor
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let dateSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = loc("recommend")
        label.font = .systemFont(ofSize: 17)
        label.textColor = .customGrayColor
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    let datePicker = UIDatePicker()
    
    let button: UIButton = {
        var button = UIButton()
        button.setTitle(loc("save"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .customBackgroundColor
        button.makeCellRounded()
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        button.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        return button
    }()
    
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = loc("notifications")
        navigationController?.navigationBar.prefersLargeTitles = false
        showDatePicker()
        setupUI()
        dateCollectionView.delegate = self
    }
    
    private func setupUI() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 15
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
        ])
        
        stackView.addArrangedSubview(timeTitleLabel)
        stackView.addArrangedSubview(timeSubtitleLabel)
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(dateTitleLabel)
        stackView.addArrangedSubview(dateSubtitleLabel)
        stackView.addArrangedSubview(dateCollectionView.view)
        stackView.addArrangedSubview(button)
    }
    
    func showDatePicker() {
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func saveData() {
        let hour = hourFormatter(hour: datePicker.date)
        let minute = minuteNotification(minute: datePicker.date)
        notificationService.notificationsScheduler(hours: hour, minute: minute, weekdays: days)
    }
    
    func daySelected(days: [Int]) {
        DispatchQueue.main.async {
            self.days = days
        }
    }
    private func hourFormatter(hour: Date) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let date = formatter.string(from: hour)
        return Int(date) ?? 0
    }
    
    private func minuteNotification(minute: Date) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm"
        let date = formatter.string(from: minute)
        return Int(date) ?? 0
    }
}
