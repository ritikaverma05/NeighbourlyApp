//
//  HomeTableViewCell.swift
//  Neighbourly
//
//  Created by RITIKA VERMA on 08/02/20.
//  Copyright © 2020 RITIKA VERMA. All rights reserved.
//


import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell{
    
    let containerView = UIView()
    let cornerDotButton = UIButton()
    let bottomLabel = UILabel()
    
    private var initialFrame: CGRect?
    private var initialCornerRadius: CGFloat?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.purple
        containerView.backgroundColor = UIColor.blue
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "HomeTableViewCell")
        self.backgroundColor = UIColor.purple
        self.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        containerView.layer.cornerRadius = 16.0
        containerView.backgroundColor = UIColor.white
        cornerDotButton.setImage(UIImage(named: "icons8-menu_2_filled"), for: .normal)
        containerView.addSubview(cornerDotButton)
        cornerDotButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(-12)
            make.top.equalTo(12)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
