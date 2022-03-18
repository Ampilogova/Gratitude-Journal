//
//  Configurable.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import Foundation

public protocol Configurable {
    
    associatedtype ConfigurationModel

    func configure(with model: ConfigurationModel)
}
