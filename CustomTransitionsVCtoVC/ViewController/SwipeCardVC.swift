//
//  SecondVC.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 02/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class SwipeCardVC: UIViewController {

    @IBOutlet weak var goBackBtn: UIButton!
    
    
    var animator = UIViewPropertyAnimator()
    var animationProgress: CGFloat = 0.0
    
    enum SwipeDirection{
        
        case left, right
    }
    
    
    var currentSwipeDirection = SwipeDirection.right
    
    var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goBackBtn.layer.cornerRadius = 20
        goBackBtn.layer.borderColor = UIColor.white.cgColor
        goBackBtn.layer.borderWidth = 3.0
        
        
        
          
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        addNewView()
    }
    
    func addNewView(){
             
              myView = UIView()
              myView.frame = CGRect(x: view.frame.midX-90, y: view.frame.midY-90, width: 180, height: 180)
              myView.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
              myView.isUserInteractionEnabled = true
              myView.layer.cornerRadius = 20
              myView.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
              myView.layer.shadowOffset = CGSize.zero
              myView.layer.shadowOpacity = 0.8
              myView.layer.shadowRadius = 5.0
        
        
              myView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
              
              let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(viewIsTouched(recognizer:)))
              myView.addGestureRecognizer(panGestureRecognizer)
        
        
              view.addSubview(myView)
        UIView.animate(withDuration: 0.5) {
            self.myView.transform = CGAffineTransform.identity
        }
                
             
        
    }
    
    
    @objc func viewIsTouched(recognizer: UIPanGestureRecognizer){
        
//        let velocity = recognizer.velocity(in: myView)
//        let translation = recognizer.translation(in: myView)
//        myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
//
//        recognizer.setTranslation(CGPoint.zero, in: view)
        
        
        switch recognizer.state {
            
            
        case .began:
            
             let translation = recognizer.translation(in: myView)
             
             
             if translation.x > 0{
                animateSwape(direction: .right)
             } else {
                animateSwape(direction: .left)
             }
          
          animator.pauseAnimation()
          animationProgress = animator.fractionComplete
         

        case .changed:
            
            let translation = recognizer.translation(in: myView)
            var fraction = translation.x/(view.frame.width)
            
        
            
            if currentSwipeDirection == .left {
                fraction *= -1
                
            }
            
            animator.fractionComplete = fraction + animationProgress
            
            
            //pivot
            
            if animator.fractionComplete == CGFloat(0){
                
                if currentSwipeDirection == .left && translation.x > 0 {
                    
                    refreshAnimator(direction: .right)
                    
                    
                } else if currentSwipeDirection == .right && translation.x < 0 {
                      refreshAnimator(direction: .left)
                    
                }
                
                
            }
            
            
            
//            print("velocityX \(velocity.x)")
//            print("velocityY \(velocity.y)")
//            print("translationX \(translation.x)")
//            print("translationY \(translation.y)")
      
        case .ended:
            
            
            let velocity = recognizer.velocity(in: myView)
            
            if animator.fractionComplete > 0.6 || velocity.x > 100 || velocity.x < -100 {
                animator.addCompletion { (position) in
                    self.myView.removeFromSuperview()
                    self.addNewView()
                }
                
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                break
            }
            
            animator.isReversed = true
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            
            
        default:
            break
        }


        
    }
    
    
    func animateSwape(direction: SwipeDirection){
        
        if animator.isRunning { return}
        
        
        currentSwipeDirection = direction
        
        animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn, animations: {
            
            let transform = CGAffineTransform(translationX: direction == .right ? self.view.frame.width : -self.view.frame.width , y: 0)
            self.myView.transform = CGAffineTransform(rotationAngle: direction == .right ? CGFloat(Double.pi/8) : -CGFloat(Double.pi/8)) .concatenating(transform)
            
        })
        
        
        
        animator.startAnimation()
    }
    
    
    func refreshAnimator(direction: SwipeDirection){
         currentSwipeDirection = direction
         animator.stopAnimation(true)
        
         animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn, animations: {
                  
                  let transform = CGAffineTransform(translationX: direction == .right ? self.view.frame.width : -self.view.frame.width , y: 0)
                  self.myView.transform = CGAffineTransform(rotationAngle: direction == .right ? CGFloat(Double.pi/8) : -CGFloat(Double.pi/8)) .concatenating(transform)
                  
              })
        
         animator.startAnimation()
         animator.pauseAnimation()
        animationProgress = animator.fractionComplete
        
    }
    
    
    

    @IBAction func goBackBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
