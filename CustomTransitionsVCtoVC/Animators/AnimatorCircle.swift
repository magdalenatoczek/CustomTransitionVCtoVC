//
//  AnimatorCircle.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 04/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation
import UIKit


class AnimatorCircle: NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate {
    
    
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(fromView)
        transitionContext.containerView.addSubview(toView)
        
        let startWidth = CGFloat(20.0)
        let startHeight = CGFloat(20.0)
      
        
        let startFrame = CGRect(x: UIScreen.main.bounds.width/2 - startWidth/2, y: UIScreen.main.bounds.height/2 + startHeight/2, width: startWidth, height: startHeight)
        let maskPath = UIBezierPath(ovalIn: startFrame)
        
        
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = toView.frame
        maskLayer.path = maskPath.cgPath
        toView.layer.mask = maskLayer
        
        
        let halfOfScreenWidth = UIScreen.main.bounds.width/2
        let halfOfScreenHight = UIScreen.main.bounds.height/2

        let circleRadius = sqrt(pow(halfOfScreenWidth, 2) + pow(halfOfScreenHight, 2))
        

        let endFrame = CGRect(x: UIScreen.main.bounds.width/2 - circleRadius, y: UIScreen.main.bounds.height/2 - circleRadius, width: 2*circleRadius, height: 2*circleRadius)
    
        let bigCellPath = UIBezierPath(ovalIn: endFrame)
        
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.setValue(transitionContext, forKey: "transitionContext")

        pathAnimation.delegate = self
        pathAnimation.fromValue = maskPath.cgPath
        pathAnimation.duration = transitionDuration(using: transitionContext)
        pathAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        pathAnimation.toValue = bigCellPath.cgPath
        maskLayer.path = bigCellPath.cgPath
        maskLayer.add(pathAnimation, forKey: nil)
        
      
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
       
        
        if let transitionContext = anim.value(forKey: "transitionContext")as? UIViewControllerContextTransitioning,
            flag {
                       transitionContext.completeTransition(true)
         
        
            
        }
        
    }
    
    
    
    
}
