//
//  DateCollectionView.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/27/22.
//

import UIKit

protocol DateCollectionViewDelegate {
  func daySelected(days: [Int])
}

class DateCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let userDefaults = UserDefaults.standard
    private let notificationsTimesKey = "NotificationsTimes"
    private var daySet = Set<String>()
    
    private let days = [loc("sun"), loc("mon"), loc("tue"), loc("wed"), loc("thu"), loc("fri"), loc("sat")]
    
    var delegate: DateCollectionViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        let selectedTimes = UserDefaults.standard.value(forKey: notificationsTimesKey) as? [String]
        daySet = Set(selectedTimes ?? [])
    }
    
    private func setUpCollectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(DateCell.self, forCellWithReuseIdentifier: DateCell.className)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8,
                                           left: 8,
                                           bottom: 8,
                                           right: 8)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 40, height: 40)
        
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    var array = [Int]()
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCell.className, for: indexPath) as! DateCell
        let model = days[indexPath.row]
        cell.label.text = model
        
        if daySet.contains(days[indexPath.row]) {
            cell.label.backgroundColor = .systemYellow
            cell.label.textColor = .customblackColor
            cell.label.layer.borderWidth = 0
            cell.label.layer.borderColor = UIColor.clear.cgColor
        } else {
            cell.label.backgroundColor = .clear
            cell.label.textColor = .systemGray2
            cell.label.layer.borderWidth = 1
            cell.label.layer.borderColor = UIColor.systemGray2.cgColor
        }
        delegate?.daySelected(days: weekday())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !daySet.contains(days[indexPath.row]) {
            daySet.insert(days[indexPath.row])
        } else {
            daySet.remove(days[indexPath.row])
        }
        selectionTimeNotification()
        collectionView.reloadData()
        delegate?.daySelected(days: weekday())
    }
    
    private func selectionTimeNotification() {
        let array = Array(daySet)
        userDefaults.set(array, forKey: notificationsTimesKey)
    }
    
    func weekday() -> [Int] {
        var result = [Int]()
        for (index, day) in days.enumerated() {
            if daySet.contains(day) {
                result.append(index + 1)
            }
        }
        return result
    }
}
