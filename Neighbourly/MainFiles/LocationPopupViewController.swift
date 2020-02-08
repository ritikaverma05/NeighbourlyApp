//
//  LocationPopupViewController.swift
//  Neighbourly
//
//  Created by RITIKA VERMA on 08/02/20.
//  Copyright © 2020 RITIKA VERMA. All rights reserved.
//

import UIKit

class LocationPopupViewController: UIViewController , UIGestureRecognizerDelegate{
    
    let parentView = UIView()
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        self.view.addSubview(parentView)
        parentView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(self.view.snp.height)
            make.top.equalTo(0)
        }
        
        parentView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(120)
            make.top.equalTo(60)
        }
        containerView.backgroundColor = UIColor.purple
        containerView.layer.cornerRadius = 9
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 16
        containerView.layer.shadowOffset = CGSize(width: 0, height: -2)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOffModal(_:)))
        tap.delegate = self
        parentView.addGestureRecognizer(tap)
        parentView.isUserInteractionEnabled = true
        
    }
    
    
    @objc func handleTapOffModal(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
    
}

