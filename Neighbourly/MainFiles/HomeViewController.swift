//
//  HomeViewController.swift
//  Neighbourly
//
//  Created by RITIKA VERMA on 08/02/20.
//  Copyright © 2020 RITIKA VERMA. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {
    
    let tbleView = UITableView()
    let locationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(locationButton)
        locationButton.setImage(UIImage(named: "icons8-marker"), for: .normal)
        locationButton.snp.makeConstraints { (make) in
            make.leading.equalTo(44)
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.top.equalTo(60)
        }
        
        let overlay: UIView = UIView(frame: CGRect(x: 0, y: 0, width: locationButton.imageView!.frame.size.width, height: locationButton.imageView!.frame.size.height))
        overlay.layer.cornerRadius = overlay.bounds.width / 2
        overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.1)
        locationButton.imageView!.addSubview(overlay)
        tbleView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        self.view.addSubview(tbleView)
        tbleView.dataSource = self
        tbleView.delegate = self
        tbleView.reloadData()
        tbleView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.bottom.equalTo(self.view.snp.bottom)
            make.top.equalTo(120)
        }
        self.view.backgroundColor = UIColor.purple
        locationButton.addTarget(self, action: Selector(("locationButtonTapped")), for: .touchUpInside)
    }
    
    
    @objc func locationButtonTapped() {
        let customAlert = LocationPopupViewController()
        customAlert.providesPresentationContextTransitionStyle = true
        customAlert.definesPresentationContext = true
        customAlert.modalPresentationStyle = UIModalPresentationStyle.custom
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(customAlert, animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbleView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let path = tbleView.indexPathForRow(at: targetContentOffset.pointee)
        if path != nil {
            if velocity.y >= 0.0 {
                let indexPath = IndexPath(row: path!.row + 1, section: path!.section)
                if indexPath.row < tbleView.numberOfRows(inSection: path!.section) {
                    tbleView.scrollToRow(at: indexPath, at: .top, animated: true)
                }
            } else {
                tbleView.scrollToRow(at: path!, at: .top, animated: true)
            }
        }
    }
    
}
