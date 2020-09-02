//
//  ViewController.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 02/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class FirstVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var goToNewVCBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        goToNewVCBtn.layer.cornerRadius = 20
        goToNewVCBtn.layer.borderColor = UIColor.white.cgColor
        goToNewVCBtn.layer.borderWidth = 3.0
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.backgroundColor = #colorLiteral(red: 1, green: 0.770628848, blue: 0.3174723195, alpha: 1)
        
        
        
    }
    
    
    

    @IBAction func goToNewVcPressed(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
        vc?.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataEnum.data.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollVCCell", for: indexPath) as! CollVCCell
        cell.cellLabel.text = DataEnum.data[indexPath.row]
        
        cell.layer.borderColor = UIColor.white.cgColor
         cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 20
        cell.layer.frame.size = CGSize(width: (self.view.frame.size.width - 80)/3, height: (self.view.frame.size.width - 80)/3)
       
        
        
        return cell
        
       }
       
    
    
    
    
    
}

