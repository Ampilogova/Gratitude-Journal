//
//  UIView+Layout.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import UIKit

public extension UIView {
    
    func pinToSuperviewCenter() {
        guard  let superview = superview else { return }
        enableAutolayoutIfNeeded()
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
    
    func pinToSuperviewHorizontalCenter() {
        guard  let superview = superview else { return }
        enableAutolayoutIfNeeded()
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }
    
    func pinToSuperviewSafeArea() {
        guard  let superview = superview else { return }
        enableAutolayoutIfNeeded()
        topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func pinToSuperviewSafeAreaBottom() {
        guard  let superview = superview else { return }
        enableAutolayoutIfNeeded()
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func pinToSuperview(leading: CGFloat = 0,
                        top: CGFloat = 0,
                        trailing: CGFloat = 0,
                        bottom: CGFloat = 0) {
        
        guard  let superview = superview else { return }
        enableAutolayoutIfNeeded()
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -trailing).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottom).isActive = true
    }
    
    func pin(leading: NSLayoutXAxisAnchor? = nil,
             top: NSLayoutYAxisAnchor? = nil,
             trailing: NSLayoutXAxisAnchor? = nil,
             bottom: NSLayoutYAxisAnchor? = nil) {
        
        enableAutolayoutIfNeeded()
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading).isActive = true
        }
        if let top = top {
            topAnchor.constraint(equalTo: top).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom).isActive = true
        }
    }
    
    func pin(leading: CGFloat? = nil,
             top: CGFloat? = nil,
             trailing: CGFloat? = nil,
             bottom: CGFloat? = nil) {
        
        guard  let superview = superview else { return }
        enableAutolayoutIfNeeded()
        if let leading = leading {
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading).isActive = true
        }
        if let top = top {
            topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom).isActive = true
        }
        
    }
    
    func pin(width: CGFloat? = nil,
             height: CGFloat? = nil) {
        
        enableAutolayoutIfNeeded()
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func pinProportional(width: CGFloat,
                         height: CGFloat) {
        
        enableAutolayoutIfNeeded()
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: width / height).isActive = true
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: height / width).isActive = true
    }
    
    private func enableAutolayoutIfNeeded() {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}

