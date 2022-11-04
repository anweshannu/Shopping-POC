    //
    //  UIView + Ext.swift
    //  ShoppingPOC
    //
    //  Created by Anwesh M on 04/11/22.
    //

import Foundation
import UIKit

extension UIView {
    
    static var nibInstance: UIView? {return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.first as? UIView}
    
    @IBInspectable var cornerRadius: CGFloat {
        get{return self.cornerRadius}
        set{self.layer.cornerRadius = newValue}
    }
    
    func addCornerRadius(_ radius: CGFloat = 4) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: -2, height: 3)
        layer.shadowRadius = 3
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func cardView(cornerRadius: CGFloat = 10) -> Void {
            self.layer.cornerRadius = cornerRadius
            self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.layer.shadowRadius = 4.0
            self.layer.shadowOpacity = 0.5
        }

}

