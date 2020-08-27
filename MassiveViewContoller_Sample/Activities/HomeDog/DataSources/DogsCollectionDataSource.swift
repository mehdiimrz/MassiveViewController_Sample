//
//  DogsCollectionDataSource.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/27/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import UIKit

class DogsCollectionDataSource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var dogs : [DetailDog]
    var coordinator : HomeDogCoordinator?
    
    init(dogs : [DetailDog]){
        self.dogs = dogs
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCell", for: indexPath) as! HomeDogCollectionViewCell
        cell.imageView.image = UIImage(named: dogs[indexPath.row].coverImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let coordinator = coordinator{
            coordinator.presentDogDetail(id: dogs[indexPath.row].id)
        }
    }
}
