//
//  NotificationViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import UIKit

import UIKit

class NotificationViewController: UIViewController, UICollectionViewDelegate {
    
//    let userDefaults = UserDefaults.standard
//    let notificationService = NotificationService()
//    let notificationsTimesKey = "NotificationsTimes"
//    
//    var timeSet = Set<String>()
//    let times = ["00:00", "12:00", "1:00", "13:00","2:00", "14:00", "3:00", "15:00", "4:00", "16:00", "5:00", "17:00", "6:00", "18:00", "7:00", "19:00", "8:00", "20:00", "9:00", "21:00", "10:00", "22:00", "11:00", "23:00"]
//    
//    
//    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        createCollectionView()
//        let selectedTimes = UserDefaults.standard.value(forKey: notificationsTimesKey) as? [String]
//        timeSet = Set(selectedTimes ?? [])
//        
//    }
//    
//    private func createCollectionView() {
//        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
//        layout.minimumInteritemSpacing = 0
//        collectionView.register(UINib(nibName: TimeCell.className, bundle: nil), forCellWithReuseIdentifier: TimeCell.className)
//        collectionView.backgroundColor = UIColor.white
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        
//        
//        view.addSubview(collectionView)
//        collectionView.pinToSuperview()
//    }
//}
//
//extension NotificationViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.view.frame.width / 2, height: 30)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return times.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  TimeCell.className, for: indexPath) as? TimeCell
//            else {
//                preconditionFailure("TimeCell can't be dequeued")
//        }
//        
//        let time = times[indexPath.row]
//        let dateFormatterLocal = DateFormatter()
//        
//        dateFormatterLocal.locale = Locale.current
//        dateFormatterLocal.dateFormat = "HH:mm"
//        let date = dateFormatterLocal.date(from: time) ?? Date()
//        let dateFormatterStyle = DateFormatter()
//        dateFormatterStyle.timeStyle = .short
//        let date1 = dateFormatterStyle.string(from: date)
//        
//        cell.timeLabel?.text = date1
//        if timeSet.contains(times[indexPath.row]) {
//            cell.selectionView.backgroundColor = UIColor.aqua
//        } else {
//            cell.selectionView.backgroundColor = nil
//        }
//        return cell
//    }
//    
//    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if !timeSet.contains(times[indexPath.row]) {
//            timeSet.insert(times[indexPath.row])
//        } else {
//            timeSet.remove(times[indexPath.row])
//        }
//        selectionTimeNotification()
//        convertTimeNotification()
//        collectionView.reloadData()
//    }
//    
//   private func selectionTimeNotification() {
//        let array = Array(timeSet)
//    userDefaults.set(array, forKey: notificationsTimesKey)
//    }
//    
//    private func convertTimeNotification() {
//        var arrayTime = [Int]()
//        let array = Array(timeSet)
//        for element in array {
//            let components = element.components(separatedBy: ":")
//            let hours = Int(components[0]) ?? 0
//            arrayTime.append(hours)
//        }
//        
//        notificationService.notificationsScheduler(hours: arrayTime)
//    }
}
