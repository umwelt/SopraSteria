//
//  SopraSteriaCollectionViewCell.swift
//  SopraSteria
//
//  Created by BMGH SRL on 16/05/2018.
//  Copyright © 2018 BMAGH. All rights reserved.
//

import UIKit

class SopraSteriaCollectionViewCell: UICollectionViewCell {
    
    // Properties
    lazy var cellImage = Init(with: UIImageView()) { imageView in
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "whiteHearth")
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        deployLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        deployLayout()
    }
    
    private func deployLayout(){
        
        contentView.backgroundColor = UIColor.pinkyPurple()
        contentView.addSubview(cellImage)
        cellImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.center.equalTo(contentView.snp.center)
        }
    }
    
    
    func with() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
