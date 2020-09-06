//
//  NavigationVC.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 04/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

enum FromWhere {
    case right
    case left
    case bottom
    case top
    case standard
    case side
    case button
    
}



class NavigationVC: UIViewController {
    
    var from = FromWhere.standard
    var btnFrame = CGRect(x: 0, y:0, width: 0, height: 0)

    @IBOutlet weak var fromButtonBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fromButtonBtn.layer.cornerRadius = 20
        fromButtonBtn.layer.borderColor = UIColor.white.cgColor
        fromButtonBtn.layer.borderWidth = 3.0
        btnFrame = fromButtonBtn.frame
        
         navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
         navigationController!.navigationBar.shadowImage = UIImage()
         navigationController!.navigationBar.isTranslucent = true
        
        navigationController?.delegate = self
        
    }
    
    
    @IBAction func fromButtonClicked(_ sender: Any) {
        from = FromWhere.button
        performSegue(withIdentifier: "thirdVC", sender: self)
    }
    
    
    
    @IBAction func defaultClicked(_ sender: Any) {
          from = FromWhere.standard
        performSegue(withIdentifier: "thirdVC", sender: self)
    }
    
    
    
    @IBAction func fromRightWithSpringBtnPressed(_ sender: Any) {
        from = FromWhere.right
         performSegue(withIdentifier: "thirdVC", sender: self)
        
    }
    
    
    @IBAction func FromLeftBtnPressed(_ sender: Any) {
        from = FromWhere.left
         performSegue(withIdentifier: "thirdVC", sender: self)
    }
    
    @IBAction func fromTopBtnPressed(_ sender: Any) {
        from = FromWhere.top
        performSegue(withIdentifier: "thirdVC", sender: self)
    }
    
    @IBAction func fromButtomBtnPressed(_ sender: Any) {
        from = FromWhere.bottom
         performSegue(withIdentifier: "thirdVC", sender: self)
    }
    
    
    
    @IBAction func fromSideBtnPressed(_ sender: Any) {
        from = FromWhere.side
        performSegue(withIdentifier: "thirdVC", sender: self)
    }
    
    
}

extension NavigationVC: UINavigationControllerDelegate {
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        switch operation{
        case .push:
            
            switch from {
            case .button:
                return AnimatorFromButtonFrame(buttonFrame: btnFrame)
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
