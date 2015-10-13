//
//  RedDot.swift
//  RedDot
//
//  Created by SEN LIU on 10/13/15.
//  Copyright © 2015 Miku. All rights reserved.
//

import UIKit

class RedDot: UIView{
    
    var number = 0 {
        didSet {
            if number == 0 {
                hidden = true
            } else {
                hidden = false
                invalidateIntrinsicContentSize()
                setNeedsLayout()
                layoutIfNeeded()
                setNeedsDisplay()
            }
        }
    }
    
    var text: String {
        get {
            return "\(number)"
        }
    }
    
    var textSize: CGSize {
        get {
            return (text as NSString).sizeWithAttributes([NSFontAttributeName : font])
        }
    }
    
    var textColor = UIColor.whiteColor()
    var bgColor = UIColor.redColor()
    var font = UIFont.systemFontOfSize(UIFont.systemFontSize())
    var paddingX: CGFloat = 5
    var paddingY: CGFloat = 3
   
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        clipsToBounds = true
    }
    
    override func drawRect(rect: CGRect) {
        bgColor.setFill()
        UIRectFill(rect)
        let x = rect.midX - textSize.width / 2
        let y = paddingY
        (text as NSString).drawAtPoint(CGPointMake(x, y), withAttributes: [NSFontAttributeName: font, NSForegroundColorAttributeName: textColor])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = intrinsicContentSize()
        layer.cornerRadius = min(size.width, size.height) / 2
    }
    
    override func intrinsicContentSize() -> CGSize {
        let height = textSize.height + 2 * paddingY
        let width = max(height, textSize.width + 2 * paddingX)
        return CGSizeMake(width, height)
    }
}