//
//  ViewController4.swift
//  appD
//
//  Created by TienDat on 12/15/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController4.huy), userInfo: nil, repeats: true)        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var imgview: UIView!
    func huy()
    {
    let chuyen1 = CATransform3DTranslate(CATransform3DIdentity, 350, 0, 0)
        let chuyen2 = CATransform3DTranslate(chuyen1, -700, 0,0)
    //    let chuyen1 = CATransform3DScale(CATransform3DIdentity, 0.4,0.4, 0.4)
        //let chuyen2 = CATransform3DScale(chuyen1, 3, 3, 3)
        
        UIView.animate(withDuration: 2, animations: {
            self.imgview.layer.transform = chuyen1
        }, completion: {
            (true) in
                UIView.animate(withDuration: 2, animations: {
                self.imgview.layer.transform = chuyen2
                }, completion: {
                (true) in
                    UIView.animate(withDuration: 3, animations: {
                        self.imgview.layer.transform = CATransform3DIdentity
                    }, completion: {
                    (true) in
                        self.dismiss(animated: true, completion: nil)
                    })
                })
            
        })
                                  //        self.view.layer.transform  = CATransform3DTranslate(CATransform3DIdentity, 100, 0, 0)
            //
            //
            //            self.view.layer.transform =  CATransform3DScale(CATransform3DIdentity, 1, 0, 0)
            //            let img = UIImageView()
            //            img.accessibilityIdentifier = ("1")
            //            self.view.addSubview(img)
            //            img.translatesAutoresizingMaskIntoConstraints =  false
            //            let top = NSLayoutConstraint(item: img, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
            //            let left =  NSLayoutConstraint(item: img, attribute: .left, relatedBy: .equal, toItem:self.view, attribute: .left, multiplier: 1, constant: 0)
            //            let width =  NSLayoutConstraint(item: img, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: 0)
            //            let heigh =  NSLayoutConstraint(item: img, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0)
            //            self.view.addConstraints([top,left,width,heigh])
            
            //             self.view.alpha = 0
            //        }, completion: {
            //            (true) in
            //           // self.dismiss(animated: true, completion: nil)
            //
            //        })
            //        self.dismiss(animated: true, completion: nil)
            // view.alpha = 1
            
            //dismiss(animated: true , completion: nil)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
}
