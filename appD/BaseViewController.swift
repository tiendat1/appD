//
//  BaseViewController.swift
//  appD
//
//  Created by TienDat on 1/3/17.
//  Copyright © 2017 TIENDAT. All rights reserved.
//

import Foundation
import UIKit
class baseViewController :UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    func setup()
    {
            view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    let imageVIew:UIImageView =
        {
            let imv = UIImageView()
            //imv.image = UIImage(named: "not")
        imv.translatesAutoresizingMaskIntoConstraints = false
            return imv
    }()

}
