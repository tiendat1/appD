//
//  Cell1.swift
//  appD
//
//  Created by TienDat on 12/20/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//

import Foundation
import  UIKit
class Cell:BaseTableViewCell
{
    let lblKH:UILabel =
        {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints =  false
        //Cho lable xuống dòng
        lbl.numberOfLines = 0
        return lbl
    }()
    override func setUp()
    {
        super.setUp()
        addSubview(lblKH)
        lblKH.centerXAnchor.constraint(equalTo: centerXAnchor).isActive  = true
        lblKH.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lblKH.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 20).isActive = true
        lblKH.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        lblKH.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive  = true
         }
}

