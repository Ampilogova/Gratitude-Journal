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
    var key: String?
    
    static func from(_ json: JSON) -> GratitudeModel {
        return GratitudeModel(
            date: json["date"].stringValue,
            gratitude: json["gratitude"].stringValue,
            key: json["key"].stringValue)
    }
    
    static func from(_ dict: [String: Any]) -> GratitudeModel? {
        let gratitude = dict["gratitude"] as? String
        let date = dict["date"] as? String
        let key = dict["key"] as? String
        return GratitudeModel(date: date, gratitude: gratitude, key: key)
    }
}

struct UserData: JSONParsable {
    var data: [String: Any]
}
