//
//  DataEnum.swift
//  CustomTransitionsVCtoVC
//
//  Created by Magdalena Toczek on 02/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import Foundation



enum DataEnum : String {
    
    case one = "modal default"
    case two = "modal fullScreen"
    case three = "coverVertical"
    case four = "flip horizontal"
    case five = "crossDissolve"
    case six = "from center"
    case seven = "to center"
    
    
    
    static let data = [one.rawValue, two.rawValue, three.rawValue, four.rawValue, five.rawValue, six.rawValue, seven.rawValue]
}
