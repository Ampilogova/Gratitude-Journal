//
//  UIView.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import UIKit

extension UIView {
    
    public func makeRounded() {
        layer.cornerRadius = 30
        layer.masksToBounds = true
    }
    
    public func makeCellRounded() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    public func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
