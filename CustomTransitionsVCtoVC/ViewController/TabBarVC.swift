//
//  tabBarVC.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 11/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class tabBarVC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    

  
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let selectedViewController = tabBarController.selectedViewController
        
        if selectedViewController == nil || viewController == selectedViewController { return false }

        guard let controllerIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else { return true }
        guard let fromView = selectedViewController?.view else{ return true }
        guard let toView = viewController.view else{ return true }
        
        
        
        let viewSize : CGRect = fromView.frame
        let scrolRight : Bool = controllerIndex > tabBarController.selectedIndex
        fromView.superview?.addSubview(toView)
        let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        toView.frame = CGRect(x: scrolRight ? screenWidth : -screenWidth, y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            
            fromView.frame = CGRect(x: scrolRight ? -screenWidth: screenWidth, y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
            
            toView.frame = CGRect(x: 0, y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
            
        }) { (success) in
            if success {
                fromView.removeFromSuperview()
                tabBarController.selectedIndex = controllerIndex
            }
        }
        
        
        return false
    }
 

}
