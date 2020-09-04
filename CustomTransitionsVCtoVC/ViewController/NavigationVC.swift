//
//  NavigationVC.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 04/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

enum FromSide {
    case right
    case left
    case bottom
    case top
    case standard
    case side
    
}



class NavigationVC: UIViewController {
    
    var from = FromSide.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
         navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
         navigationController!.navigationBar.shadowImage = UIImage()
         navigationController!.navigationBar.isTranslucent = true
        
        navigationController?.delegate = self
        
    }
    
    
    
    
    
    @IBAction func defaultClicked(_ sender: Any) {
          from = FromSide.standard
        performSegue(withIdentifier: "firstVC", sender: self)
    }
    
    
    
    @IBAction func fromRightWithSpringBtnPressed(_ sender: Any) {
        from = FromSide.right
         performSegue(withIdentifier: "firstVC", sender: self)
        
    }
    
    
    @IBAction func FromLeftBtnPressed(_ sender: Any) {
        from = FromSide.left
         performSegue(withIdentifier: "firstVC", sender: self)
    }
    
    @IBAction func fromTopBtnPressed(_ sender: Any) {
        from = FromSide.top
        performSegue(withIdentifier: "firstVC", sender: self)
    }
    
    @IBAction func fromButtomBtnPressed(_ sender: Any) {
        from = FromSide.bottom
         performSegue(withIdentifier: "firstVC", sender: self)
    }
    
    
    
    @IBAction func fromSideBtnPressed(_ sender: Any) {
        from = FromSide.side
        performSegue(withIdentifier: "firstVC", sender: self)
    }
    
    
}

extension NavigationVC: UINavigationControllerDelegate {
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        switch operation{
        case .push:
            
            switch from {
            case .side:
                return AnimatorFromRightScale()
            case .standard:
                  return nil
            case .bottom:
                  return AnimatorFromBottom()
            case .right:
                  return AnimatorFromRightToLeftWithSpring()
            case .left:
                  return AnimatorFromLeft()
            case .top:
                  return AnimatorFromTop()
            }
            
            
            
            
        
        case .pop:
              return nil
            
        default:
            
            return nil
        }
        
        
        
        
    
    }

    
    
    
}
