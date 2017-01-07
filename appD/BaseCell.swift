//
//  BaseCell.swift
//  appD
//
//  Created by TienDat on 12/20/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//

import Foundation
import  UIKit
class BaseTableViewCell: UITableViewCell
{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    func setUp()
    {
     backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
