//
//  HomeDogViewController.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/25/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import UIKit

final class HomeDogViewController: UIViewController {
    
    // MARK: Properties
    
    private var dogsData = [HomeDog]()
    
    private var bannerDogs = [DetailDog]()
    
    weak var coordinator : HomeDogCoordinator?
    
    private lazy var dogsBanner : DogsBannerViewController = {
       
        let dogBannerVC = DogsBannerViewController(banners: self.bannerDogs)
        dogBannerVC.coordinator = self.coordinator
        add(dogBannerVC)
        return dogBannerVC
    }()
    
    private lazy var dogsList : DogsListViewController = {
       
        let dogListVC = DogsListViewController(dogs: self.dogsData)
        dogListVC.coordinator = self.coordinator
        add(dogListVC)
        return dogListVC
    }()
    
    
    private let dataProvider = MockDataProvider()
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogsData = dataProvider.getHomeDogs()
        bannerDogs = dataProvider.getDetailDogs()
                               .findRndom(count: 3)
        setup()
    }
}

// MARK: Helper
extension HomeDogViewController{
    
    private func setup(){
        
        self.title = "Breeds"
        
        // DogsBanner Child View Controller
        dogsBanner.view.constrainTop(to: view, withHeight: 400)
        
        // DogsList Child View Controller
        dogsList.view.constrainTop(to: view, toTopView: dogsBanner.view)
        
        
        
    }
}
