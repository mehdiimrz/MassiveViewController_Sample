//
//  DetailDogViewController.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/26/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import UIKit

final class DetailDogViewController: UIViewController {
    
    
    // MARK: Initializer
    let dog : DetailDog
    
    init(dogId : Int){
        self.dog = dataProvider.getDetailDogs()
            .findDogWithId(dogId: dogId)!
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Properties
    let dataProvider = MockDataProvider()
    
    lazy var closeButton : UIButton = {
        
        let buttonImage = UIImage(named: "close")!
        let tintedImage = buttonImage.withRenderingMode(.alwaysTemplate)
        let closeBtn = UIButton(type: UIButton.ButtonType.custom)
        closeBtn.setImage(tintedImage, for: .normal)
        closeBtn.tintColor = .white
        closeBtn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        let origImage = UIImage(named: "imageName")
        
        
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        return closeBtn
        
    }()
    
    lazy var scrollView : UIScrollView = {
        
        let scrollView = UIScrollView()
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    lazy var dogImage : UIImageView = {
        let dogImage = UIImageView()
        dogImage.image = UIImage(named: dog.coverImage)
        dogImage.contentMode = .scaleAspectFill
        dogImage.translatesAutoresizingMaskIntoConstraints = false
        return dogImage
    }()
    
    lazy var dogDescription : UILabel = {
        let dogLable = UILabel()
        dogLable.numberOfLines = 0
        dogLable.font = UIFont(name: "Futura-Medium", size: 18)
        dogLable.backgroundColor = UIColor(named: "LabelColor")
        dogLable.text = dog.desc
        dogLable.setLineHeight(lineHeight: 1.5)
        dogLable.translatesAutoresizingMaskIntoConstraints = false
        return dogLable
        
    }()
    
    lazy var mainStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
        
    }()
    
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    
    
    
}


// MARK: Helper
extension DetailDogViewController {
    private func setupView(){
        
        self.title = self.dog.title
        
        view.backgroundColor = .white
        
        // ScrollView
        view.addSubview(scrollView)
        scrollView.constrainEdges(to: view)
        
        // ImageView
        mainStackView.addArrangedSubview(dogImage)
        dogImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        // LabelView
        mainStackView.addArrangedSubview(dogDescription)
        
        // StackView
        scrollView.addSubview(mainStackView)
        mainStackView.constrainEdges(to: scrollView)
        mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        // ButtonView
        view.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 22).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
