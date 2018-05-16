//
//  SopraCollectionViewController.swift
//  SopraSteria
//
//  Created by BMGH SRL on 16/05/2018.
//  Copyright © 2018 BMAGH. All rights reserved.
//

import UIKit

class SopraCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // CollectionView
    
    lazy var collectionView: UICollectionView = {
        
        let layout:UPCarouselFlowLayout = {
            let layout = UPCarouselFlowLayout()
            layout.itemSize = CGSize(width: 250 , height: 250 )
            layout.sideItemScale = 0.6
            layout.scrollDirection = .horizontal
            return layout
        }()
        
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        collectionView.register(SopraSteriaCollectionViewCell.self,
                                forCellWithReuseIdentifier: SopraSteriaCollectionViewCell.identifier)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }
        
        
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sopra Collection"
        view.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        deployLayout()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func deployLayout(){
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.width.equalTo(view.snp.width).offset(20)
            make.height.equalTo(300)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        collectionView.reloadData()
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SopraSteriaCollectionViewCell.identifier, for: indexPath) as! SopraSteriaCollectionViewCell
        
    
        cell.with()
        
        return cell
    }



}
