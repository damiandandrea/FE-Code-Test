//
//  CCLabel.swift
//

import Foundation

@IBDesignable public class CCLabel : UILabel {
    
    @IBInspectable var isTopAlignment: Bool = false{
        didSet {
            setNeedsDisplay()
        }
    }

    override public func drawText(in rect: CGRect) {
        
        if isTopAlignment {
            var targetRect = textRect(forBounds: rect, limitedToNumberOfLines: numberOfLines)
            targetRect.origin.y = 0
            super.drawText(in: targetRect)
        }
        else {
            super.drawText(in: rect)
        }        
    }
}
