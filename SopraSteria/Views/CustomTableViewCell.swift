//
//  CustomTableViewCell.swift
//  SopraSteria
//
//  Created by BMGH SRL on 15/05/2018.
//  Copyright © 2018 BMAGH. All rights reserved.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    // Properties
    
    // Image
    fileprivate lazy var newImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "profileAvatar")
        
        return imageView
    }()
    
    // Title
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        
        return label
    }()
    
    fileprivate lazy var newLabel = Init(with: UILabel()) { label in
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
    }
    
    // SubTitle
    fileprivate lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.pinkyPurple()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    
    var customString: String = "" {
        didSet {
            titleLabel.text = customString
        }
    }
    
    var subtitleString: String = "" {
        didSet {
            subtitleLabel.text = subtitleString
        }
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // layout
        deployLayout()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // layout
        deployLayout()
    }
    
    private func deployLayout(){
        

        
        // * first element anchored to the top of contenView
        contentView.addSubview(newImage)
            newImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(10)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(newImage.snp.right).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
        }
        
        
        // Last element anchored to the bottom of contentView
        contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(titleLabel.snp.left)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
            // later
            make.right.equalTo(contentView.snp.right).offset(-10)
        }
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func with(news: News) {
        customString = news.title
        subtitleString = news.subtitle
    }

}
