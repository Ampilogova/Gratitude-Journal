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
    
    var reference = Database.database().reference(withPath: "Gratitude journal")
    
    let user = Auth.auth().currentUser?.uid
    
    public func saveData(gratitude: String) {
        var dataDictionary: [String: Any] = [:]
        dataDictionary["gratitude"] = gratitude
        dataDictionary["date"] = currentDate()
        dataDictionary["key"] = createKey(date: Date())
        let userRef = self.reference.child("\(String(describing: user))/\(createKey(date: Date()))")
        userRef.setValue(dataDictionary)
    }
    
    public func currentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        let langStr = Locale.current.languageCode
        if langStr == "ru" {
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "d.\nMM"
            return dateFormatter.string(from: date)
        } else {
            dateFormatter.dateFormat = "d\nMMM"
            return dateFormatter.string(from: date)
        }
    }
    
    public func createKey(date: Date) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        return dateFormatter.string(from: date)
}

    public func loadGratitudes(completion: @escaping ([GratitudeModel]) -> Void) {
        reference.child("\(user)").observeSingleEvent(of: .value, with: { (snapShot) in
            if let data = snapShot.value as? [String: Any] {
                let models = data.values
                    .compactMap({ $0 as? [String: Any] })
                    .compactMap({ GratitudeModel.from($0) })
                completion(models)
            } else {
                completion([])
            }
        }) { (error) in print(error.localizedDescription) }
    }
    
    public func editData(key: String, value: String) {
        reference.child("\(user)/\(key)").updateChildValues(["gratitude" : value])
    }
    
    public func removeData(key: String) {
        reference.child("\(user)/\(key)").removeValue()
    }
    
   public func logoutUser() {
        do {
            try Auth.auth().signOut()
            
        }
        catch {
            print("already logged out")
        }
       
       UserDefaults.standard.removeObject(forKey: "isLogin")
       UserDefaults.standard.synchronize()
    }
}
