//
//  NotificationViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import UIKit

class NotificationViewController: UIViewController, DateCollectionViewDelegate, Alert {
    
    var dateCollectionView = DateCollectionView()
    private let notificationService = NotificationService()
    private var days = [Int]()
    
    private let timeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = loc("time")
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .customblackColor
        label.textAlignment = .left
        label.numberOfLines = 4
        return label
    }()
    
    private let timeSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = loc("morning")
        label.font = .systemFont(ofSize: 14)
        label.textColor = .customGrayColor
        label.textAlignment = .left
        label.numberOfLines = 4
        return label
    }()
    
    private let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = loc("day")
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .customblackColor
        label.textAlignment = .left
        label.numberOfLines = 4
        return label
    }()
    
    private let dateSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = loc("recommend")
        label.font = .systemFont(ofSize: 14)
        label.textColor = .customGrayColor
        label.textAlignment = .left
        label.numberOfLines = 4
        return label
    }()
    
    private let datePicker = UIDatePicker()
    private let collectionView = UIView()
    
    let button: UIButton = {
        var button = UIButton()
        button.setTitle(loc("save"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .customBackgroundColor
        button.makeCellRounded()
        button.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = loc("notifications")
        navigationController?.navigationBar.prefersLargeTitles = false
        showDatePicker()
        setupUI()
        dateCollectionView.delegate = self
    }
    
    private func setupUI() {
        timeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeTitleLabel)
        NSLayoutConstraint.activate([
            timeTitleLabel.heightAnchor.constraint(equalToConstant: 45),
            timeTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            timeTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            timeTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])

        timeSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeSubtitleLabel)
        NSLayoutConstraint.activate([
            timeSubtitleLabel.heightAnchor.constraint(equalToConstant: 35),
            timeSubtitleLabel.topAnchor.constraint(equalTo: timeTitleLabel.bottomAnchor, constant: 5),
            timeSubtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            timeSubtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.heightAnchor.constraint(equalToConstant: 100),
            datePicker.topAnchor.constraint(equalTo: timeSubtitleLabel.bottomAnchor, constant: 5),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
        
        dateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateTitleLabel)
        NSLayoutConstraint.activate([
            dateTitleLabel.heightAnchor.constraint(equalToConstant: 45),
            dateTitleLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            dateTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            dateTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
        
        dateSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateSubtitleLabel)
        NSLayoutConstraint.activate([
            dateSubtitleLabel.heightAnchor.constraint(equalToConstant: 35),
            dateSubtitleLabel.topAnchor.constraint(equalTo: dateTitleLabel.bottomAnchor, constant: 5),
            dateSubtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            dateSubtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 70),
            collectionView.topAnchor.constraint(equalTo: dateSubtitleLabel.bottomAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        dateCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        collectionView.addSubview(dateCollectionView.view)
        NSLayoutConstraint.activate([
            dateCollectionView.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            dateCollectionView.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            dateCollectionView.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            dateCollectionView.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
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
        self.showAlert(title: loc("done"), message: "")
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
