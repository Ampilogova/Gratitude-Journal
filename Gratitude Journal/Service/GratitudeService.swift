//
//  GratitudeService.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/11/22.
//

import Foundation

class GratitudeService {
    
    let defaults = UserDefaults.standard
    
    public func currentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE\nMMMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
    public func saveData(gratitudeThings: String, happyThings: String, mood: String) {
        let gratitudeData = defaults.value(forKey: "Gratitude")
        var dict = gratitudeData as? [String: [String]] ?? [:]
        let dateKey = currentDate()
        dict[dateKey] = [gratitudeThings, happyThings, mood]
        defaults.set(dict, forKey: "Gratitude")
    }
    
    public func printData() {
        print(defaults.value(forKey: "Gratitude"))
    }
    
    public func historyByDay(at date: String) -> String {
        let gratitudeData = defaults.value(forKey: "Gratitude")
        let dict = gratitudeData as? [String: [String: String]] ?? [:]
        let values = dict[date] ?? [:]
        var result = ""
        for element in values {
            result = result + element.value
        }
        return result
    }
    
    public func history() -> [(date: String, value: String)] {
        let gratitudeData = defaults.value(forKey: "Gratitude")
        let dict = gratitudeData as? [String: [String: String]] ?? [:]
        let days = Array(dict.keys)
        var results = [String]()
        for day in days {
            let result = historyByDay(at: day)
            results.append(result)
        }
        
        var historyArray = [(date: String, value: String)]()
        for (day, result) in zip(days, results) {
            historyArray.append((day, result))
        }
        
        return historyArray.sorted(by: { $01.date < $0.date })
    }
}
