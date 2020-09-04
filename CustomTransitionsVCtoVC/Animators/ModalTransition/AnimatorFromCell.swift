//
//  AnimatorCircular.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 03/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation
import UIKit


class AnimatorFromCell: NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate {
    
    var cellFrame: CGRect

    
    init(cellFrame: CGRect) {
        self.cellFrame = cellFrame
    }
    
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(fromView)
        transitionContext.containerView.addSubview(toView)
        
      
        
        let maskPath = UIBezierPath(roundedRect: cellFrame, cornerRadius: 20)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = toView.frame
        maskLayer.path = maskPath.cgPath
        
        toView.layer.mask = maskLayer
        
        
        let screenHeight = UIScreen.main.bounds.height
        let screenYHeight = screenHeight - cellFrame.midX
        let cellYHeight = cellFrame.height/2
        let scaleFactor = screenYHeight / cellYHeight
        
        
        let endFrameWidth = scaleFactor * cellFrame.width
        let endFrameHeight = endFrameWidth
        
        let endFrameXPos = toView.frame.midX - (endFrameWidth/2)
        let endFrameYPos = CGFloat(0) - cellFrame.height
        
       let endFrame = CGRect(x: endFrameXPos, y: endFrameYPos, width: endFrameWidth, height: endFrameHeight)
    
        
        
        
        let bigCellPath = UIBezierPath(roundedRect: endFrame, cornerRadius: 20)
        
        
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


