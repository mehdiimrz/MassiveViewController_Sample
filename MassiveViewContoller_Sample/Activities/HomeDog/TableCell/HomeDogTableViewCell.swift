//
//  HomeDogTableViewCell.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/25/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import UIKit

final class HomeDogTableViewCell: UITableViewCell {

    
    // MARK: Properties
       
    lazy var dogImage : UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var dogTitle : UILabel = {
        
        let dogLable = UILabel()
        dogLable.font = UIFont(name: "Chalkduster", size: 18)
        dogLable.translatesAutoresizingMaskIntoConstraints = false
        return dogLable
    }()
    
    // MARK: Initilizer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: Helper
extension HomeDogTableViewCell {
    
    fileprivate func setup() {
        
        backgroundColor = .systemGray6
        
        // Dog Image
        addSubview(dogImage)
        dogImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        dogImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dogImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dogImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Dog Title
        addSubview(dogTitle)
        dogTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dogTitle.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dogTitle.leadingAnchor.constraint(equalTo: dogImage.trailingAnchor , constant: 5).isActive = true
        
    }
}

