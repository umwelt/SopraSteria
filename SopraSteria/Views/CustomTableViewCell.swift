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
    
    // Properties
    
    fileprivate lazy var customLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My cell"
        label.textColor = .black
        
        return label
    }()
    
    // Image View
    
    
    /// another label
    
    var customString: String = "" {
        didSet {
            customLabel.text = customString
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
        
        // Add imageview
        
        contentView.addSubview(customLabel)
        customLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.left.equalTo(20)
        }
        
        /// add secondary label
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func with(value: Int) {
        customString = String(value)
    }

}
