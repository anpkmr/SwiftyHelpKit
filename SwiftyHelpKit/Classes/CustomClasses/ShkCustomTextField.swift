//
//  CustomTextField.swift
//  SwiftyHelpKit
//
//  Created by SwiftyHelpKit on 9/20/18.
//

import UIKit

@IBDesignable
public class ShkCustomTextField: UITextField {
    
    private var isRound = false
    private var isMarkedUnderLine = false
    
    @IBInspectable public var isRounded: Bool = false {
        didSet {
            isRound = isRounded
        }
    }
    
    @IBInspectable public var makeUnderLined: Bool = false {
        didSet {
            isMarkedUnderLine = makeUnderLined
        }
    }
    
    @IBInspectable public var borderHeight: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderHeight
        }
    }
    @IBInspectable public var shkBorderColor: UIColor? {
        didSet {
            if isMarkedUnderLine == false {
                layer.borderColor = shkBorderColor?.cgColor
            }
        }
    }
    
    @IBInspectable public var cornerRadius:CGFloat = 0 {
        didSet {
            if isMarkedUnderLine == false {
                layer.cornerRadius = cornerRadius
            }
        }
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if isMarkedUnderLine == true {
            addUnderLine()
            return
        }
        cornerRadius = (isRound == true ? (frame.size.height / 2) : cornerRadius)
        layer.masksToBounds = true
    }
    
    func addUnderLine(){
        self.layer.borderColor = UIColor.clear.cgColor
        let border = CALayer()
        borderStyle = .none
        border.borderColor = self.shkBorderColor?.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - self.borderHeight, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = self.borderHeight
        self.layer.masksToBounds = true
        self.layer.addSublayer(border)
    }
}

