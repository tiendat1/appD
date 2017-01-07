//
//  NotConnect.swift
//  appD
//
//  Created by TienDat on 1/3/17.
//  Copyright © 2017 TIENDAT. All rights reserved.
//

import Foundation
import UIKit
class viewControllerError:baseViewController
{
      override func viewDidLoad() {
        super.setup()
        imageVIew.image = UIImage(named: "not")
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(imageVIew)
        view.addContrainWWithVS(format: "V:|[v0]|", views: imageVIew)
        view.addContrainWWithVS(format: "H:|[v0]|", views: imageVIew)

    }
}
