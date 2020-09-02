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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goBackBtn.layer.cornerRadius = 20
        goBackBtn.layer.borderColor = UIColor.white.cgColor
        goBackBtn.layer.borderWidth = 3.0
        
    }
    

    @IBAction func goBackBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
