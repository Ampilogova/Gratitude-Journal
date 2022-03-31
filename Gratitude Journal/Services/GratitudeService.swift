//
//  GratitudeService.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/11/22.
//

import Foundation
import Firebase
import SwiftyJSON

class GratitudeService {
    
    private let uuid = UIDevice.current.identifierForVendor?.uuidString
    
    var reference = Database.database().reference(withPath: "Gratitude journal")
    
    public func saveData(gratitude: String) {
        var dataDictionary: [String: Any] = [:]
        dataDictionary["gratitude"] = gratitude
        dataDictionary["date"] = currentDate()
        let userRef = self.reference.child("uuid/\(Date())")
        userRef.setValue(dataDictionary)
    }
    
    public func currentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d\nMMM"
        return dateFormatter.string(from: date)
    }
    
    public func loadData(completion: @escaping (UserData) -> Void) {
        reference.child("uuid").observeSingleEvent(of: .value, with: { (snapShot) in
            if let data = snapShot.value as? [String: Any] {
                let userData = UserData(data: JSON(data).rawValue as! [String : Any])
                completion(userData)
            }
        }) { (error) in print(error.localizedDescription) }
    }
    
    public func removeData(key: String) {
        reference.child("uuid/\(key)").removeValue()
    }
}
