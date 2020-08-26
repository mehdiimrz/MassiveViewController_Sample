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
    
    private var dogsData = [HomeDog](){
        didSet{
            dogsTable.reloadData()
        }
    }
    
    private var bannerDogs = [DetailDog](){
        didSet{
            dogCollection.reloadData()
        }
    }
    
    private lazy var dogCollection : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width , height: 200)
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame : .zero ,collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.isPagingEnabled = true
        collection.register(HomeDogCollectionViewCell.self, forCellWithReuseIdentifier: "FeatureCell")
        view.addSubview(collection)
        return collection
    }()
    
    
    private lazy var dogsTable : UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .lightGray
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 110
        tableView.register(HomeDogTableViewCell.self, forCellReuseIdentifier: "DogCell")
        return tableView
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
        
        
        //CollectionView
        view.addSubview(dogCollection)
        dogCollection.constrainTop(to: view, withHeight: 200)
        
        // TableView
        view.addSubview(dogsTable)
        dogsTable.constrainTop(to: view, toTopView: dogCollection)
        
        
        
    }
}

// MARK: TableView Datasource and Delegate
extension HomeDogViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogCell", for: indexPath) as! HomeDogTableViewCell
        cell.dogImage.image = UIImage(named: dogsData[indexPath.row].image)
        cell.dogTitle.text = dogsData[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dogVc = DetailDogViewController(dogId: dogsData[indexPath.row].id)
        present(dogVc, animated: true, completion: nil)
    }
   
    
}

// MARK: CollectionView Datasource and Delegate
extension HomeDogViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerDogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCell", for: indexPath) as! HomeDogCollectionViewCell
        cell.imageView.image = UIImage(named: bannerDogs[indexPath.row].coverImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dogVc = DetailDogViewController(dogId: bannerDogs[indexPath.row].id)
        present(dogVc, animated: true, completion: nil)
    }
    
}
