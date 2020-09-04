//
//  AnimatorFromLeft.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 04/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class AnimatorFromLeft: NSObject, UIViewControllerAnimatedTransitioning{
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    
        guard let toView = transitionContext.view(forKey: .to) else { return }
        

        transitionContext.containerView.addSubview(toView)
        
        let currentPosition = toView.frame.origin
        
        let vcWith = toView.frame.width
    
        toView.frame.origin = CGPoint(x: currentPosition.x - vcWith, y: currentPosition.y)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 30, options: .curveEaseInOut, animations: {
            
            toView.frame.origin = CGPoint(x: currentPosition.x, y: currentPosition.y)
            
        }, completion: { (success) in
             transitionContext.completeTransition(true)
        })
            
      
        
        
    }
    
    
    
}
