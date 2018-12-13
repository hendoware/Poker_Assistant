//
//  SwipingViewController.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/12/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
    
    let menuView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.backgroundColor = .yellow
        navigationItem.title = "Swipe feature"
        
        view.addSubview(menuView)
        menuView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 44))
        
        collectionView.backgroundColor = .white
        collectionView.anchor(top: menuView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 44, left: 0, bottom: 0, right: 0))
    }
}


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?,
                leading:NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                trailing: NSLayoutXAxisAnchor?,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let top = top,
            let leading = leading,
            let bottom = bottom,
            let trailing = trailing
            else { return }
        
        topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
