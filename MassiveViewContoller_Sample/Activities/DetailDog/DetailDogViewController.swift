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
        self.dog = try! DetailDog.findDetail(dogId: dogId)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    
    
    
}

extension DetailDogViewController {
    private func setupView(){
        
    }
}
