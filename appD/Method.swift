//
//  Method.swift
//  appD
//
//  Created by TienDat on 1/3/17.
//  Copyright © 2017 TIENDAT. All rights reserved.
//

import Foundation
import  UIKit
enum Method:String{
    case get = "GET"
    case post = "POST"
    var toString:String
    {
        return self.rawValue
    }
    
}
