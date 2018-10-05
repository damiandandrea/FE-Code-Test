//
//  UIViewExtension.swift
//

import Foundation
import UIKit

extension UIView {

    // MARK: - Layout Methods
    func fitToSuperView(){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["view": self]
        
        superview!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        
        superview!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    }
    
    func centerToSuperView(){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["superview": self.superview!,"view": self]
        
        superview!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[superview]-(<=1)-[view]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: views))
        
        superview!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[superview]-(<=1)-[view]", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views))
    }

    func horizontalCenterToSuperView(){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["superview": self.superview!,"view": self]
        
        superview!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[superview]-(<=1)-[view]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: views))
    }
    
    func bottomSpaceToSuperview(space: CGFloat){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["view": self]
        
        superview!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-\(space)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    }

    func setWidthLayout(width: CGFloat){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["view": self]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[view(\(width))]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    }
    
    func setHeightLayout(height: CGFloat){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["view": self]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view(\(height))]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    }
    
    //MARK: - Misc
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
    func roundCorner(value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
}
