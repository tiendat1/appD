//
//  Playlist.swift
//  appD
//
//  Created by TienDat on 12/27/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//

import Foundation
struct Playlist:BaseModel
{
    var id: String
    //var idPlaylist:String
    var titPlaylist:String
    var titkhongdauPlaylist:String
    var listPlaylist:Array<Video> = []
        init()
    {
        
        id = ""
        titPlaylist = ""
        titkhongdauPlaylist = ""
        listPlaylist = []
    }
    init(object:Any)
    {
  if  let dic:Dictionary<String,AnyObject> =  object as? Dictionary<String,AnyObject>
        {
        if let list =  dic["listVideos"] as? Array<AnyObject>
        {
            for i in list
            {
                listPlaylist.append(Video(object: i))
            }
        }
        else
        {
            listPlaylist = []
        }
        if let idPl = dic["id"]
        {
            id = idPl as! String
        }
        else
        {
        id = ""
        }
        if let titPl = dic["tit"]
        {
            titPlaylist = titPl as! String
        }
        else
        {
            titPlaylist = ""
        }
       if let titkhongdauPl = dic["tit_khongdau"]
       {
        titkhongdauPlaylist = titkhongdauPl as! String
        }
        else
        {
            titkhongdauPlaylist = ""
        }
        
            }
        else
        {
            id = ""
            titPlaylist = ""
            titkhongdauPlaylist = ""
            listPlaylist = []
        }
     }
}
