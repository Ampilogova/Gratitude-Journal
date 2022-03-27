//
//  DatabaseReference.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/21/22.
//

import Foundation
import Firebase

public extension DatabaseReference {
    var keyOrUUID: String {
        return key ?? UUID().uuidString
    }
}
