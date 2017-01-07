//
//  ViewController.swift
//  appD
//
//  Created by TienDat on 12/15/16.
//  Copyright © 2016 TIENDAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewnone:UIView =
        {
            let v  = UIView()
           v.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            //  v.image(UIImage:named = "ha")
            v.translatesAutoresizingMaskIntoConstraints =  false
            return v
    }()
    let viewxanh:UIView =
        {
            let x  = UIView()
            x.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            x.translatesAutoresizingMaskIntoConstraints =  false
            return x
    }()
 lazy var tblView:UITableView =
    {
        let tbl = UITableView(frame: CGRect.zero, style: UITableViewStyle.grouped)
        tbl.register(Cell.self, forCellReuseIdentifier: "Cell")
        tbl.register(Cell2.self, forCellReuseIdentifier: "Cell2")
       tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.estimatedRowHeight = 100
        tbl.rowHeight = UITableViewAutomaticDimension
        tbl.dataSource = self
        return tbl
    
    }()
  lazy  var collView:UICollectionView = {
        let coll:UICollectionView =  UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    coll.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        coll.translatesAutoresizingMaskIntoConstraints =  false
        coll.register(collCell.self, forCellWithReuseIdentifier: "Coll")
        coll.delegate =  self
        coll.dataSource = self
        return coll
            
    }()
    func setupTableView()
    {
        view.addSubview(tblView)
        view.addContrainWWithVS(format: "V:|[v0]|", views: tblView)
        view.addContrainWWithVS(format: "H:|[v0(350)]", views: tblView)
    }
    func setUpmenu()
    {
            //AUTOLAYOUT CODE
        view.addSubview(viewnone)
        view.addContrainWWithVS(format: "V:|[v0]|", views: viewnone)
        view.addContrainWWithVS(format: "H:|[v0]|", views: viewnone)

   //     view.addSubview(viewxanh)
        
        //cách 1 chia đôi màn hình
       // let height = UIScreen.main.bounds.height/2
        //cách 2 chia đôi màn hình
        
        
    //   viewnone.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        
        
//        viewnone.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        viewnone.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        viewnone.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
//        viewnone.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
       // view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V: |v0|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":viewnone]))
        // view.addContrainWWithVS(format: "H:|[v0]|", views: viewxanh)

    }
    
    func setUpcCollView()
    {
        viewnone.addSubview(collView)
        viewnone.addContrainWWithVS(format: "V:|-64-[v0]|", views: collView)
        viewnone.addContrainWWithVS(format: "H:|[v0]|", views: collView)
    }

    let arrChat:Array<String> = ["menu","Hello Everybody !!!","anh","SayHi !!!","menu","Make some noise !!! !!!","anh","How do you feel Today !!!","menu","HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH","anh"]
       func setUpGesture()
    {
        let close :UISwipeGestureRecognizer =  UISwipeGestureRecognizer()
        close.direction = .left
        close.addTarget(self, action: #selector(ViewController.menuClose(_ :)))
        let open:UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer()
        open.edges = .left
        open.addTarget(self, action: #selector(ViewController.menuOpen(a :)))
        viewnone.addGestureRecognizer(close)
        viewnone.addGestureRecognizer(open)
        
    }
    func menuClose(_ sender:UIScreenEdgePanGestureRecognizer)
    {
        if sender.state == .ended
        {
            UIView.animate(withDuration: 2, animations: {
            self.action()
            })
                   }

    }
    func menuOpen(a sender:UISwipeGestureRecognizer)
    {
        if sender.state == .ended
        {
            UIView.animate(withDuration: 2, animations: {
              self.action()
            })
        }
    }
    func selectXanh(object:Notification)
    {
        print("Da nhan duoc Click !!!")
        let vd =  object.object as! Video
        let vc = manhinh2() 
        vc.video = vd
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //khai báo mảng playlist
    var arrPlaylist:Array<Playlist> = []
    
    func loadData()
    {
    load(linkAPI: APi.getCata){
        (objectJson) in
        if objectJson == nil
        {
        self.present(viewControllerError(), animated: true, completion: nil)
        }
        else
        {
        
                let object:Array<AnyObject>  = objectJson as! Array<AnyObject>          // print(object)
                // xuất ra playlist dạng mảng
                for i in object
                {
                    let playlist:Playlist = Playlist(object: i)
                    self.arrPlaylist.append(playlist)
                }
             //  print(self.arrPlaylist)
                    self.collView.reloadData()
            }
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.chuyen), userInfo: nil, repeats: true)
//        load(linkAPI: APi.getSP, parameter: "index=0&numberPages=4")
//        {
//        (object) in
//            print(object)
//        }
        //numbetpagesphần tử lấy từ file
        let img = UIImage(named:"anh")
        load(linkAPI: APi.postman, method: .post, parameter: ["file":img!,"sa":"sa"]) {
            (object)  in
            print(object!)
        }
        loadData()
        //tạo action click cho collView bên nhận
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.selectXanh), name: NSNotification.Name.init("clickXanh"), object: nil)
        
        setupTableView()
        setUpmenu()//Thay đổi thứ tự của table view
        setUpGesture()
        setUpcCollView()
        view.backgroundColor =  #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        navigationItem.title = "Home"
        let button = UIBarButtonItem(image: UIImage(named:"menu"), style: .plain, target: self, action: #selector(ViewController.action))
            navigationItem.leftBarButtonItem = button
        // Do any additional setup after loading the view, typically from a nib.
    }
    var isMenu:Bool = false
    
    func action()
    {
        if isMenu == false
        {
            let move = CATransform3DTranslate(CATransform3DIdentity, 330, 0, 0)
            //     let move1 = CATransform3DTranslate(CATransform3DIdentity, 100, 0, 0)
            UIView.animate(withDuration: 0, animations: {
                self.navigationController?.navigationBar.layer.transform = move
                
            }, completion: {(true) in
                self.viewnone.layer.transform = move
            })

        }
        else
        {
           // let move = CATransform3DTranslate(CATransform3DIdentity, 100, 0, 0)
            //     let move1 = CATransform3DTranslate(CATransform3DIdentity, 100, 0, 0)
                self.navigationController?.navigationBar.layer.transform = CATransform3DIdentity
                self.viewnone.layer.transform = CATransform3DIdentity
        }
         isMenu = !isMenu
       //        let tong = CATransform3DConcat(move, move1)
            }
    //thay đổi thanh navigation
//    override func viewDidAppear(_ animated: Bool)
//    {
//        navigationController?.navigationBar.frame.origin.x = 100
//    }
//    
    
//    func chuyen()
//    {
//        let a = UIStoryboard(name: "demo", bundle: nil).instantiateViewController(withIdentifier: "mhdemo")
//        present(a, animated: true, completion: nil)
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row % 2 != 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
            cell.lblKH.text = arrChat[indexPath.row]
            return cell
            

        }
            else
        {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! Cell2
            cell2.imgView.image =  UIImage(named: arrChat[indexPath.row])
            return cell2
            
        }
    
    }
}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrPlaylist.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll", for: indexPath) as! collCell
        cell.listvideo = arrPlaylist[indexPath.row].listPlaylist
        cell.cColl.reloadData()
        return cell
    }
    //ĐIỀU CHỈNH WIDTH VS HEIGHT
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
            return CGSize(width: UIScreen.main.bounds.width-20, height: 100)
    }
    //Hàm hở chiều ngang của Coll
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
  {
        return 1
   }
    //Hàm hở chiều dọc của Coll
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        cell.alpha  = 0
        let tranform = CATransform3DTranslate(CATransform3DIdentity,0 ,-600, 0)
        cell.layer.transform = tranform
        UIView.animate(withDuration: 3, animations: {
        cell.alpha = 1
        cell.layer.transform = CATransform3DIdentity
        })
    }
   }

