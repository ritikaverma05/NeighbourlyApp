//
//  DetailsViewController.swift
//  Neighbourly
//
//  Created by RITIKA VERMA on 08/02/20.
//  Copyright © 2020 RITIKA VERMA. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    let containerView = UIView()
    let bottomView = UIView()
    let send = UIButton()
    let audio = UIButton()
    let leftImage = UIImageView()
    let textField = UITextField()
    var viewTranslation = CGPoint(x: 0, y: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.purple
        self.view.addSubview(containerView)
        
        containerView.backgroundColor = UIColor.white
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        containerView.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(-40)
            make.top.equalTo(40)
        }
        
        containerView.addSubview(bottomView)
        bottomView.backgroundColor = UIColor.orange
        bottomView.snp.makeConstraints { (make) in
            make.leading.equalTo(0)
            make.width.equalTo(containerView.snp.width)
            make.height.equalTo(70)
            make.bottom.equalTo(0)
        }
        
        bottomView.addSubview(leftImage)
        leftImage.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.centerY.equalTo(bottomView.snp.centerY)
        }
        leftImage.layer.cornerRadius = 15
        leftImage.clipsToBounds = true
        leftImage.image = UIImage(named: "jynerso")
        
        
        bottomView.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.leading.equalTo(70)
            make.width.equalTo(100)
            make.centerY.equalTo(bottomView.snp.centerY)
        }
        textField.placeholder = "Answer...."
        textField.textColor = UIColor.white
        textField.delegate = self
        
        bottomView.addSubview(audio)
        audio.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomView.snp.centerY)
            make.leading.equalTo(330)
        }
        audio.layer.cornerRadius = 15
        audio.clipsToBounds = true
        audio.setImage(UIImage(named: "icons8-microphone-1"), for: .normal)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
    // MARK: - Start Typing
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        leftImage.isHidden  = true
        textField.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.width.equalTo(80)
            make.centerY.equalTo(bottomView.snp.centerY)
        }
        
        audio.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomView.snp.centerY)
            make.leading.equalTo(280)
        }
        
        bottomView.addSubview(send)
        send.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomView.snp.centerY)
            make.leading.equalTo(330)
        }
        send.layer.cornerRadius = 15
        send.clipsToBounds = true
        send.setImage(UIImage(named: "sent"), for: .normal)
    }
    
    // MARK: - Drag Down to Dismiss
    
    @objc func handlePresentView() {
        let vc = DetailsViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 200 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
}
