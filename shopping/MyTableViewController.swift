

//
//  MyTableViewController.swift
//  shopping
//
//  Created by User on 2019/2/5.
//  Copyright © 2019 g87. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController,UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    let images = ["1","2","3","4","5","6","7","1"]
    @IBOutlet weak var mycollectionview: UICollectionView!
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

      mycollectionview.dataSource = self
        mycollectionview.delegate = self
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeBanner), userInfo: nil, repeats: true)
    }
    //輪播
    @objc func changeBanner(){
        var  indexPath : IndexPath
        imageIndex += 1
        if imageIndex < images.count{
            indexPath  = IndexPath(item: imageIndex, section: 0)
            mycollectionview.selectItem(at: indexPath, animated: true,scrollPosition: .centeredHorizontally)
            
        }else{
            imageIndex = 0
            indexPath  = IndexPath(item: imageIndex, section: 0)
            mycollectionview.selectItem(at: indexPath, animated: false,scrollPosition: .centeredHorizontally)
            changeBanner()
        }
        
       
    }
    

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! MyCollectionViewCell
        cell.myImageView.image=UIImage(named: images[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }
}
