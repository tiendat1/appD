//
//  CollCell.swift
//  appD
//
//  Created by TienDat on 12/22/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//
//Cấu hình COllectionview trong Collectionview
import Foundation
import  UIKit
class collCell:baseCCell
{
 lazy  var cColl :UICollectionView =
        {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let colll:UICollectionView =  UICollectionView(frame: CGRect.zero, collectionViewLayout:layout)
            colll.translatesAutoresizingMaskIntoConstraints =  false
            colll.backgroundColor =  UIColor.clear
            colll.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
           colll.register(collCel2.self, forCellWithReuseIdentifier: "Coll2")
            colll.delegate = self
            colll.dataSource = self
            return  colll
    }()
    func setUpColl()
    {
    addSubview(cColl)
        addContrainWWithVS(format: "V:|[v0]|", views: cColl)
        addContrainWWithVS(format: "H:|[v0]|", views: cColl)
    
    }
   override func setUp()
{
    backgroundColor  = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    setUpColl()
    }
    var listvideo:Array<Video> = []
    
}
extension collCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listvideo.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll2", for: indexPath) as! collCel2
        cell.video = listvideo[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.height - 10, height: frame.size.height - 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    // tạo action click cho collView bên chuyền 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("aaaaaa")
        NotificationCenter.default.post(name:Notification.Name.init("clickXanh"),object:indexPath)
        
    }
}
