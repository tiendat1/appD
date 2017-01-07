//
//  ViewController2.swift
//  appD
//
//  Created by TienDat on 12/15/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//

import Foundation
import  UIKit

class manhinh2:UIViewController
{
    let webView:UIWebView = {
            let wbv = UIWebView()
            wbv.scrollView.isScrollEnabled =  false
            wbv.translatesAutoresizingMaskIntoConstraints = false
            return wbv
    }()
    var video:Video = Video()
    var link:String{
    return "https://www.youtube.com/embed/\(video.id)"
    }
    override func viewDidLoad()
    {
        view.addSubview(webView)
        view.addContrainWWithVS(format: "H:|[v0]|", views: webView)
        view.addContrainWWithVS(format: "V:|[v0]|", views: webView)
        let url:URL = URL(string: link)!
        let request:URLRequest = URLRequest(url: url)
        webView.loadRequest(request)
              view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
}
}
