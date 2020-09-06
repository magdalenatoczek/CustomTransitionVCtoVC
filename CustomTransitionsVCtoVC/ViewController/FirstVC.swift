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
    
    var transitionOption = DataEnum.modal_default
    var cellFrame = CGRect(x: 0, y: 0, width: 10, height: 10)
    
  
    

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
        
        if let frame = collectionView.cellForItem(at: indexPath)?.frame {
            cellFrame = frame
        }
        

     let option = DataEnum.data[indexPath.row]
       
  
        switch option {
        case DataEnum.fromCell.rawValue:
                               let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                               transitionOption = DataEnum.fromCell
                               vc?.transitioningDelegate = self
                               vc?.modalPresentationStyle = .fullScreen
                               present(vc!, animated: true, completion: nil)
                               break
       
        case DataEnum.modal_default.rawValue:
            
                    let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                    transitionOption = DataEnum.modal_default
                    present(vc!, animated: true, completion: nil)
                    break
        case DataEnum.fullScreen.rawValue:
                    let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                    vc?.modalPresentationStyle = .fullScreen
                    transitionOption = DataEnum.fullScreen
                    present(vc!, animated: true, completion: nil)
                    break
        case DataEnum.coverVertical.rawValue:
                    let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                    transitionOption = DataEnum.coverVertical
                    vc?.modalPresentationStyle = .fullScreen
                    vc?.modalTransitionStyle = .coverVertical
                    present(vc!, animated: true, completion: nil)
                   
                    break
        case DataEnum.flipHorizontal.rawValue:
                     let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                     vc?.modalPresentationStyle = .fullScreen
                     transitionOption = DataEnum.flipHorizontal
                     vc?.modalTransitionStyle = .flipHorizontal
                     present(vc!, animated: true, completion: nil)
                     break
        case DataEnum.crossDissolve.rawValue:
                      let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                      vc?.modalTransitionStyle = .crossDissolve
                    transitionOption = DataEnum.crossDissolve
                      present(vc!, animated: true, completion: nil)
                      break
        case DataEnum.fromCenter.rawValue:
                        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                        vc?.transitioningDelegate = self
                          transitionOption = DataEnum.fromCenter
                        vc?.modalPresentationStyle = .fullScreen
                        present(vc!, animated: true, completion: nil)
                               break
        
        case DataEnum.toCenter.rawValue:
                        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                        vc?.transitioningDelegate = self
                          transitionOption = DataEnum.toCenter
                        vc?.modalPresentationStyle = .fullScreen
                        present(vc!, animated: true, completion: nil)
                        break
            
            
            case DataEnum.circle.rawValue:
            let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
            vc?.transitioningDelegate = self
            transitionOption = DataEnum.circle
            vc?.modalPresentationStyle = .fullScreen
            present(vc!, animated: true, completion: nil)
            break
            
            
        case DataEnum.disappear.rawValue:
                                   let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
                                   vc?.transitioningDelegate = self
                                     transitionOption = DataEnum.disappear
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
        case DataEnum.fromCell:
            animator = AnimatorFromCell(cellFrame: cellFrame)
            break
        case DataEnum.circle:
            animator = AnimatorCircle()
            break
        case DataEnum.fromCenter:
            animator = AnimatorFromCenter()
            break
        case DataEnum.toCenter:
            animator = AnimatorToCenter()
            break
        case DataEnum.disappear:
            animator = AnimatorDisappear()
            break
        default:
             animator = AnimatorFromCenter()
            break
        }
  
       return animator
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        var animator: UIViewControllerAnimatedTransitioning?
                
            switch transitionOption {
                
                case DataEnum.fromCenter:
                    animator = AnimatorFromCenter()
                    break
                case DataEnum.toCenter:
                    animator = AnimatorFromCenter()
                    break
                case DataEnum.disappear:
                    animator = AnimatorDisappear()
                    break
                case DataEnum.fromCell:
                    animator = nil
                    break
                default:
                     animator = AnimatorFromCenter()
                    break
                }
          
               return animator
        
        
    }
    
    
    
    
    
    
}

