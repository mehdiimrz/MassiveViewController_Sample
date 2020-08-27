//
//  DogsBannerViewController.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/27/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import UIKit

final class DogsBannerViewController: UIViewController {
    
    
    // MARK: Properties
    
    weak var coordinator : HomeDogCoordinator?{
        didSet{
            dataSource.coordinator = coordinator
        }
    }
    
    private var dataSource : DogsCollectionDataSource
    
    private var banners = [DetailDog](){
        didSet{
            dogCollection.reloadData()
        }
    }
    
    fileprivate lazy var dogCollection : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width , height: 350)
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame : .zero ,collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = dataSource
        collection.delegate = dataSource
        collection.isPagingEnabled = true
        collection.register(HomeDogCollectionViewCell.self, forCellWithReuseIdentifier: "FeatureCell")
        view.addSubview(collection)
        return collection
    }()
    
    init(banners : [DetailDog]){
        self.banners = banners
        self.dataSource = DogsCollectionDataSource(dogs: banners)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        setupViews()
        
    }
    
}

// MARK: Helper
extension DogsBannerViewController{
    private func setupViews(){
        
        
        // Collection View
        view.addSubview(dogCollection)
        dogCollection.constrainEdges(to: view)
        
    }
    
}

