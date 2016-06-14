//
//  Extenstion.swift
//  quiz
//
//  Created by Nguyen Dinh Duy on 6/9/16.
//  Copyright © 2016 Nguyen Dinh Duy. All rights reserved.
//

import UIKit
import Foundation

extension UIView
{
    enum ShakeType{
        case x
        case y
    }
    
    
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil)
    {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        self.layer.addAnimation(rotateAnimation, forKey: nil)
    }
    
    func pulseToSize(scale : CGFloat, duration: NSTimeInterval, l_repeat: Bool)
    {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = duration
        animation.toValue = scale as NSNumber
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.autoreverses = true
        animation.repeatCount = l_repeat ? HUGE : 0
        
        layer.addAnimation(animation, forKey: "pulse")
    }
    
    
    func shake(type: ShakeType) {
        var animation : CAKeyframeAnimation! // = CAKeyframeAnimation(keyPath: "transform.translation.x")
        switch type {
        case .x:
            animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
            break
        case .y:
            animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
            break
        }
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.5
        animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.addAnimation(animation, forKey: "shake")
    }
}