//
//  BaseCollCell.swift
//  appD
//
//  Created by TienDat on 12/22/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//

import Foundation
import  UIKit
class baseCCell:UICollectionViewCell
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setUp()
    }
    override func layoutSubviews() {
        setupSub()
    }
    func setupSub()
    {
        
    }
    func setUp()
    {
    
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
