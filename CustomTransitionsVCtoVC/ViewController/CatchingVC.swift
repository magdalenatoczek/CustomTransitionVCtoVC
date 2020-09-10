//
//  ThirdVC.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 06/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

enum ViewStatus{
    case open
    case close
}



class CatchingVC: UIViewController {

    @IBOutlet weak var thumbanilImageView: UIImageView!
    
    @IBOutlet weak var topConstaint: NSLayoutConstraint!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var largeImage: UIImageView!
    
    
    var viewStatus = ViewStatus.close
    var animator = UIViewPropertyAnimator()
    
    var constantForConstaint = CGFloat(0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        thumbanilImageView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        thumbanilImageView.addGestureRecognizer(tapGestureRecognizer)
        blurView.layer.cornerRadius = 40.0
        blurView.layer.masksToBounds = true
        largeImage.clipsToBounds = true
        
        constantForConstaint = topConstaint.constant
        topConstaint.constant = view.frame.height
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(openOrCloseView(recognizer:)))
        
        view.addGestureRecognizer(panGesture)
        // Do any additional setup after loading the view.
    }

  @objc  func imageTapped(){
        
    UIView.animate(withDuration: 1) {
        self.topConstaint.constant = self.constantForConstaint
        self.viewStatus = ViewStatus.open
        self.view.layoutIfNeeded()
    }
   
    }
    
    @objc func openOrCloseView(recognizer: UIPanGestureRecognizer){
      
        switch recognizer.state {
            
        case .began:
            
            let translation = recognizer.translation(in: view)
            
            
            print(translation.y)
            
            if viewStatus == ViewStatus.open && translation.y > 0{
                
                animate(viewStatus: ViewStatus.close)
            } else if viewStatus == ViewStatus.close && translation.y < 0{
                animate(viewStatus: ViewStatus.open)
            }
            
            
            
            break
        case .changed:
            
            
            
            break
            
        case .ended:
         break
            
        default:
            break
            
        }
        
        
    }
    
    
    
    func animate(viewStatus: ViewStatus){
        
        self.viewStatus = viewStatus
        
        animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn, animations: {
            if viewStatus == .open{
                self.topConstaint.constant = self.constantForConstaint
                 self.view.layoutIfNeeded()
            }else if viewStatus == .close{
                self.topConstaint.constant = self.view.frame.height
                 self.view.layoutIfNeeded()
            }
       
        })
        
        animator.startAnimation()
        
        
    }
    


}
