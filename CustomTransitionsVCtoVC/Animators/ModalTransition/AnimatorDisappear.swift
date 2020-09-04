//
//  AnimatorDisappearing.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 03/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//


import Foundation


import UIKit


class AnimatorDisappear: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
  
        toView.alpha = 0
        
        transitionContext.containerView.addSubview(fromView)
        transitionContext.containerView.addSubview(toView)
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.alpha = 1.0
        }) { (success) in
            transitionContext.completeTransition(true)
        }
        
        
        
        
        
        
    }
    
    
    
    
}

