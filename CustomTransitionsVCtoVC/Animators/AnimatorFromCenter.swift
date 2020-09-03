//
//  Animator.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 03/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation


import UIKit


class AnimatorFromCenter: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        toView.transform = CGAffineTransform(scaleX: 0, y: 0)
        toView.alpha = 0
        
        transitionContext.containerView.addSubview(fromView)
        transitionContext.containerView.addSubview(toView)
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.transform = CGAffineTransform.identity
            toView.alpha = 1.0
        }) { (success) in
            transitionContext.completeTransition(true)
        }
        
        
        
        
        
        
    }
    
    
    
    
}
