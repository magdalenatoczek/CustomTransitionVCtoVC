//
//  AnimatorFromButtonFrame.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 06/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation
import UIKit

class AnimatorFromButtonFrame: NSObject, UIViewControllerAnimatedTransitioning{
    
    
    var buttonFrame: CGRect
    
    
    init(buttonFrame: CGRect) {
        self.buttonFrame = buttonFrame
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        1
        
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    
        guard let toView = transitionContext.view(forKey: .to) else { return }
       
        
        let fromFrame = buttonFrame
        let toFrame = toView.frame
        

        
        
        let scaleFactorWidth = fromFrame.width/toFrame.width
        let scaleFactorHeight = fromFrame.height/toFrame.height
              
        toView.transform = CGAffineTransform(scaleX: scaleFactorWidth, y: scaleFactorHeight)
        
        
        
        toView.center = CGPoint(x: fromFrame.midX, y: fromFrame.midY)
    
        transitionContext.containerView.addSubview(toView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 3, options: .curveEaseIn, animations: {
            
            toView.transform = CGAffineTransform.identity
            toView.center = CGPoint(x: toFrame.midX, y: toFrame.midY)
            
        }, completion: { (success) in
             transitionContext.completeTransition(true)
        })
            
      
        
        
    }
    
    
    
}
