//
//  CustomImageView.swift
//  SwiftyHelpKit
//
//  Created by anoop on 9/20/18.
//

import UIKit

@IBDesignable
public class ShkCustomImageView: UIImageView {
    
    private var isCir = false
    @IBInspectable public var isCircular:Bool = false {
        didSet {
            isCir = isCircular
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        guard isCir && (frame.size.width == frame.size.height) else {
            layer.cornerRadius = 0
            print("Can not make circular image Either isCircular is false or width is != height")
            return
        }
        layer.masksToBounds = true
        layer.cornerRadius = frame.size.width/2.0
       
    }
    
    
    
}
