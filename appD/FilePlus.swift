//
//  FilePlus.swift
//  appD
//
//  Created by TienDat on 12/17/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
func addContrainWWithVS(format:String,views:UIView...)
    {
        var dic:Dictionary<String,Any> = [:]
        for (index,value) in views.enumerated()
        {
            value.translatesAutoresizingMaskIntoConstraints = false
            dic["v\(index)"] =  value
        }
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: dic))
    }
    
}
extension UIImageView
{
    func loadImageOnline(link:String)
    {
        let indicator:UIActivityIndicatorView =
            {
                let indi = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
                indi.color =  #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                indi.translatesAutoresizingMaskIntoConstraints  = false
                return indi
        }()

        self.addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive  = true
        indicator.startAnimating()
        let queue = DispatchQueue(label: "queue")
        queue.async {
            let url = URL(string: link)
            do
            {
                //bug
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.image = UIImage(data:data)
                    indicator.stopAnimating()
                    indicator.hidesWhenStopped =  true
                }
                
            }
            catch{}
        }
        
    }
    
}
func generateBoundaryString() -> String
{
    return "Boundary-\(NSUUID().uuidString)"
}

func getTime() -> String{
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let second = calendar.component(.second, from: date)
    let nano = calendar.component(.nanosecond, from: date)
    return "\(hour)-\(minutes)-\(second)-\(nano)"
}
func getDate()->String{
    let date = Date()
    let calendar = Calendar.current
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    return "\(day)/\(month)/\(year) \(hour):\(minutes)"
}

func load(linkAPI:APi,method:Method = .get,parameter:Dictionary<String,Any>? =  nil,completion:@escaping (Any?)->())
{
    // phương thức post get đọc dữ liệu trên file về
    var link = linkAPI.fullLink
    if method == .get
    {

    if parameter != nil
    {
        link = link + "?" + (parameter?.convertoString())!
  }
    }
    
    let url = URL(string: link )
    var request = URLRequest(url: url!)
    if method == .post
    {
        let boundary = generateBoundaryString()
        let body = NSMutableData()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        for pr in parameter!
        {
            
            if let image:UIImage = pr.value as? UIImage
            {
                
                let data = UIImageJPEGRepresentation(image, 0.5)
                let fname:String = "\(getTime()).jpeg"
                let mimetype = "image/png"
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition:form-data; name=\"\(pr.key)\"; FileName=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append(data!)
                body.append("\r\n".data(using: String.Encoding.utf8)!)
            }else
            {
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(pr.key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(pr.value)\r\n".data(using: String.Encoding.utf8)!)
            }
            
        }
    //lấy dữ liệu gán về kiểu String thông qua param
    request.httpMethod = method.toString
        request.httpBody = body as Data
    }
    //
    let session = URLSession.shared
    session.dataTask(with: request, completionHandler: {(data,res,err) in
        if err == nil{
        do{
           let object =  try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            DispatchQueue.main.async {
                completion(object)
            }
            }catch
            {
                DispatchQueue.main.async
                    {
                     completion(nil)
                }
            }
            }else
        {
            DispatchQueue.main.async {
                completion(nil)

            }
        }
    }).resume()
}
//["hoten":"dat","tuoi":"18"] --> "hoten=dat&tuoi=00"
extension Dictionary
{
    func convertoString()->String
        {
     var str:String = ""
            for (i,v) in self.enumerated()
                {
                    if i == 0
            {
                str += "\(v.key)=\(v.value)"
                }
                    else
                    {
                    str += "&\(v.key)=\(v.value)"
                        }
            }
            return str
    }
}
















