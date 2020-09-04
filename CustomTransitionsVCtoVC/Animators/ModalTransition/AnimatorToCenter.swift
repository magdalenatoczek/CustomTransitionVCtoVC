//
//  AnimatorToCenter.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 03/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation
import UIKit

class AnimatorToCenter: NSObject, UIViewControllerAnimatedTransitioning{
    
    
       func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
           0.8
       }
       
       func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
           
           guard let fromView = transitionContext.view(forKey: .from) else { return }
           guard let toView = transitionContext.view(forKey: .to) else { return }
           

           transitionContext.containerView.addSubview(toView)
           transitionContext.containerView.bringSubviewToFront(fromView)
           
           UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
               
               fromView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
               fromView.alpha = 0.0
               
               
           }) { (success) in
               transitionContext.completeTransition(true)
           }
           
           
       }
    
  
    
    
}
