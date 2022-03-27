//
//  GratitudeModel.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/18/22.
//

import Foundation
import SwiftyJSON

struct GratitudeModel: JSONParsable {
    var date: String?
    var gratitude: String?
    
    static func from(_ json: JSON) -> GratitudeModel {
        return GratitudeModel(
            date: json["mood"].stringValue,
            gratitude: json["gratitude"].stringValue)
    }
    
    static func from(_ dict: [String: Any]) -> GratitudeModel? {
        let gratitude = dict["gratitude"] as? String
        let date = dict["date"] as? String
        return GratitudeModel(date: date, gratitude: gratitude)
    }
}

struct UserData: JSONParsable {
    var data: [String: Any]
    
//    static func from(_ dict: [String: Any]) -> UserData {
//        let gratitude = dict["gratitude"] as? String
//        let happyThings = dict["happy_things"] as? String
//        let mood = dict["mood"] as? String
//        
//        return UserData(data: [])
//    }
}
