//
//  CollCell2.swift
//  appD
//
//  Created by TienDat on 12/22/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//

import Foundation
import UIKit
class collCel2: baseCCell
{
    let imgView:UIImageView =
        {
            let img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints =  false
            img.image =  UIImage(named:"014")
            return  img
        }()
    var video:Video =  Video()
    override func setupSub()
    {
    imgView.loadImageOnline(link: video.linkVideo)
    }
    override func setUp()
    {
        backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addSubview(imgView)
        addContrainWWithVS(format: "V:|[v0]|", views: imgView)
        addContrainWWithVS(format: "H:|[v0]|", views: imgView)
        
    }
}
