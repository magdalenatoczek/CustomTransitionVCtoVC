//
//  DataEnum.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 02/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation



enum DataEnum : String {
    
    case modal_default = "modal default"
    case fullScreen = "modal fullScreen"
    case coverVertical = "cover Vertical"
    case flipHorizontal = "flip horizontal"
    case crossDissolve = "cross Dissolve"
    case fromCenter = "from center"
    case toCenter = "to center"
    case disappear = "disappear"
    case fromCell = "from Cell"
    case circle = "circle"
    
    
    static let data = [flipHorizontal.rawValue, crossDissolve.rawValue,circle.rawValue, fromCenter.rawValue, toCenter.rawValue, disappear.rawValue, modal_default.rawValue, fullScreen.rawValue, coverVertical.rawValue, fromCell.rawValue]
    
    
    
    
}
