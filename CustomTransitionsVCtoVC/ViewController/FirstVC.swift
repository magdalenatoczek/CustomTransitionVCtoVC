//
//  ViewController.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 02/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

class FirstVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIViewControllerTransitioningDelegate {
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var transitionOption = DataEnum.one
    
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.backgroundColor = #colorLiteral(red: 1, green: 0.770628848, blue: 0.3174723195, alpha: 1)
        
        
        
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
       

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
   
     let option = DataEnum.data[indexPath.row]
       
  
        switch option {
        case DataEnum.one.rawValue:
            
                    let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                    transitionOption = DataEnum.one
                    present(vc!, animated: true, completion: nil)
                    break
        case DataEnum.two.rawValue:
                    let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                    vc?.modalPresentationStyle = .fullScreen
                    transitionOption = DataEnum.two
                    present(vc!, animated: true, completion: nil)
                    break
        case DataEnum.three.rawValue:
                    let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                    transitionOption = DataEnum.three
                    vc?.modalPresentationStyle = .fullScreen
                    vc?.modalTransitionStyle = .coverVertical
                    present(vc!, animated: true, completion: nil)
                   
                    break
        case DataEnum.four.rawValue:
                     let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                     vc?.modalPresentationStyle = .fullScreen
                     transitionOption = DataEnum.four
                     vc?.modalTransitionStyle = .flipHorizontal
                     present(vc!, animated: true, completion: nil)
                     break
        case DataEnum.five.rawValue:
                      let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                      vc?.modalTransitionStyle = .crossDissolve
                    transitionOption = DataEnum.five
                      present(vc!, animated: true, completion: nil)
                      break
        case DataEnum.six.rawValue:
                        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                        vc?.transitioningDelegate = self
                          transitionOption = DataEnum.six
                        vc?.modalPresentationStyle = .fullScreen
                        present(vc!, animated: true, completion: nil)
                               break
        
        case DataEnum.seven.rawValue:
                        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                        vc?.transitioningDelegate = self
                          transitionOption = DataEnum.seven
                        vc?.modalPresentationStyle = .fullScreen
                        present(vc!, animated: true, completion: nil)
                        break
            
    
        default:
            break
        }
        
       
        
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        var animator: UIViewControllerAnimatedTransitioning!
        
        switch transitionOption {
        case DataEnum.six:
            animator = AnimatorFromCenter()
            break
        case DataEnum.seven:
            animator = AnimatorToCenter()
            break
        default:
             animator = AnimatorFromCenter()
            break
        }
  
       return animator
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        var animator: UIViewControllerAnimatedTransitioning!
                
            switch transitionOption {
                case DataEnum.six:
                    animator = AnimatorFromCenter()
                    break
                case DataEnum.seven:
                    animator = AnimatorFromCenter()
                    break
                default:
                     animator = AnimatorFromCenter()
                    break
                }
          
               return animator
        
        
    }
    
    
    
    
    
    
}

