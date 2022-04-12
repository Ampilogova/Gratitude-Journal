//
//  QuoteModel.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/27/22.
//

import Foundation
import SwiftyJSON

public struct QuoteModel {
    public let quote: String
    public let quoteRu: String
    public let author: String
    public let authorRu: String
    
    public var localizedTitle: (String, String) {
        let isEnglish = loc("Localization") == "English"
        return isEnglish ? (quote, author) : (quoteRu, authorRu)
    }
    
    static func from(_ json: JSON) -> QuoteModel {
        return QuoteModel(quote: json["quote"].stringValue,
                         quoteRu: json["quoteRu"].stringValue,
                         author: json["author"].stringValue,
                         authorRu: json["authorRu"].stringValue)
    }
    
    static func from(_ dict: [String: Any]) -> QuoteModel? {
        let quote = dict["quote"] as? String
        let quoteRu = dict["quoteRu"] as? String
        let author = dict["author"] as? String
        let authorRu = dict["authorRu"] as? String
        
        return QuoteModel(quote: quote ?? "", quoteRu: quoteRu ?? "", author: author ?? "", authorRu: authorRu ?? "")
    }
}

struct Quotes: JSONParsable {
    var data: [String: Any]
}
