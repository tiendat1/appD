//
//  Api.swift
//  appD
//
//  Created by TienDat on 1/3/17.
//  Copyright © 2017 TIENDAT. All rights reserved.
//

import Foundation
import UIKit
//let domain:String = "http://hidaacamedy.com"
enum APi:String
{
    case postman = "uploadImage.php"
    case getSP = "GETSP.php"
    case dataJson = "dataJson"
    case getCata = "Cata.php"
    case postImage = "PostImage.php"
    var fullLink:String
    {
     
    return "http://hihello.hol.es/" + self.rawValue
    }
}
