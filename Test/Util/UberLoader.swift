//
//  UberLoader.swift
//  Note
//
//  Created by Muhammad Zahid Imran on 7/5/17.
//  Copyright © 2017 Muhammad Zahid Imran. All rights reserved.
//

import Foundation
import UIKit

private var shapeKey = 0

extension UIView {
    var hudLayer: CAShapeLayer? {
        get {
            return objc_getAssociatedObject(self, &shapeKey) as! CAShapeLayer?
        }
        
        set {
            objc_setAssociatedObject(self, &shapeKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    public func showLinearHud(_ topPadding: Double = 0.0) {
        if self.hudLayer != nil {
            return
        }
        
        let hudl = CAShapeLayer()
        hudLayer = hudl
        hudl.path = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: Double(self.bounds.width), height: 1.0), cornerRadius: self.layer.cornerRadius).cgPath
        hudl.masksToBounds = true
        hudl.fillColor = UIColor.clear.cgColor
        hudl.frame = self.bounds
        
        let lineShape = CAShapeLayer()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        
        lineShape.frame = CGRect(x: 0, y: CGFloat(topPadding), width: self.bounds.width, height: 1)
        lineShape.path = path.cgPath
        lineShape.strokeColor = UIColor.black.cgColor
        lineShape.lineWidth = 4.0
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        /* set up animation */
        strokeEndAnimation.fromValue = 0.02
        strokeEndAnimation.toValue = 1.0
        strokeEndAnimation.duration = 0.7
        strokeEndAnimation.isRemovedOnCompletion = false
        
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        /* set up animation */
        strokeStartAnimation.fromValue = 0.0
        strokeStartAnimation.toValue = 1.0
        strokeStartAnimation.duration = 0.9
        strokeStartAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        strokeStartAnimation.isRemovedOnCompletion = false
        
        let group = CAAnimationGroup()
        group.duration = 0.8
        group.autoreverses = true
        group.repeatCount = .greatestFiniteMagnitude
        group.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        group.animations = [strokeEndAnimation, strokeStartAnimation]
        group.isRemovedOnCompletion = false
        lineShape.add(group, forKey: "drawLineAnimation")
        
        self.layer.addSublayer(hudl)
        hudLayer?.addSublayer(lineShape)
    }
    
    public func hideLinearHud() {
        if let lineShape = hudLayer {
            lineShape.removeAllAnimations()
            lineShape.removeFromSuperlayer()
        }
        self.hudLayer = nil
    }
}
