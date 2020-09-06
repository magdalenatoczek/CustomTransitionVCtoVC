//
//  SecondVC.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 02/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var goBackBtn: UIButton!
    
    var myView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goBackBtn.layer.cornerRadius = 20
        goBackBtn.layer.borderColor = UIColor.white.cgColor
        goBackBtn.layer.borderWidth = 3.0
        
        
        
        myView.frame = CGRect(x: view.frame.midX-90, y: view.frame.midY-90, width: 180, height: 180)
        myView.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        myView.isUserInteractionEnabled = true
        myView.layer.cornerRadius = 20
        myView.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        myView.layer.shadowOffset = CGSize.zero
        myView.layer.shadowOpacity = 0.8
        myView.layer.shadowRadius = 5.0
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(viewIsTouched(recognizer:)))
        myView.addGestureRecognizer(panGestureRecognizer)
        
        view.addSubview(myView)
        
        
    }
    
    
    @objc func viewIsTouched(recognizer: UIPanGestureRecognizer){
        
       // let velocity = recognizer.velocity(in: myView)
        let translation = recognizer.translation(in: view)
        myView.center = CGPoint(x: myView.center.x + translation.x, y: myView.center.y + translation.y)
        
        recognizer.setTranslation(CGPoint.zero, in: view)
        
        
//        switch recognizer.state {
//        case .began:
//            print("began")
//            break
//        case .changed:
//            print("velocityX \(velocity.x)")
//            print("velocityY \(velocity.y)")
//            print("translationX \(translation.x)")
//            print("translationY \(translation.y)")
//            break
//        case .ended:
//            print("ended")
//            break
//        default:
//            break
//        }


        
    }
    
    
    

    @IBAction func goBackBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
