//
//  Video.swift
//  appD
//
//  Created by TienDat on 12/27/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//

import Foundation
struct Video:BaseModel
{
    var id: String
    //var idVideo:String
    var tenVideo:String
    var tenkhongdau:String
    var linkVideo:String
    init()
    {
        id = ""
        tenVideo = ""
        tenkhongdau = ""
        linkVideo = ""
    }
    init(object:Any)
    {
        if let dic  = object as? Dictionary<String,AnyObject>
        {
            if let id = dic["idVideo"] as? String
            {
                
               self.id = id
            }
            else
            {
                self.id = ""
            }
            if let ten = dic["ten"] as?String
            {
                tenVideo = ten
            }
            else
            {
            tenVideo = ""
            }
            if let tenkd = dic["ten_khongdau"] as? String
            {
            tenkhongdau = tenkd
            }
            else
            {
            tenkhongdau  = ""
            }
            if let link = dic["linkHinh"] as? String
            {
            linkVideo = link
            }
            else
            {
                linkVideo = ""
            }
        }
        else
        {
            id = ""
            tenVideo = ""
            tenkhongdau = ""
            linkVideo = ""
        }
    }
}
