//
//  AnimatorTransitionSecond.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 11/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation


import Foundation


import UIKit


class AnimatorTransitionSecond: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
   
        transitionContext.containerView.addSubview(fromView)
        transitionContext.containerView.addSubview(toView)
        
        
        
        //option .showHideTransitionViews - when we don't want to remove from superview
        UIView.transition(from: fromView, to: toView, duration: transitionDuration(using: transitionContext), options: .transitionCurlDown) { (success) in
            transitionContext.completeTransition(true)
        }
        
        
    }
    
    
    
    
}
