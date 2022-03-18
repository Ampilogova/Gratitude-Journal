//
//  Localize.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import Foundation

public func loc(_ string: String) -> String {
    return NSLocalizedString(string, tableName: nil, bundle: Bundle.main, value: "", comment: "")
}
