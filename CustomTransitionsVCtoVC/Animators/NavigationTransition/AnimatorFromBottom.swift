//
//  AnimatorFromBottom.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 04/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation
import UIKit

class AnimatorFromBottom: NSObject, UIViewControllerAnimatedTransitioning{
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(toView)
        
        let currentPosition = toView.frame.origin
        
        let vcHeight = toView.frame.height
    
        toView.frame.origin = CGPoint(x: currentPosition.x, y: currentPosition.y + vcHeight)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: .curveEaseIn, animations: {
            
            toView.frame.origin = CGPoint(x: currentPosition.x, y: currentPosition.y)
            
        }, completion: { (success) in
             transitionContext.completeTransition(true)
        })
            
      
        
        
    }
    
    
    
}
