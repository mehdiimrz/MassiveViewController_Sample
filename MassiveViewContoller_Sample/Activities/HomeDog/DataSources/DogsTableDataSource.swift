//
//  DogsTableDataSource.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/27/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import UIKit

class DogsTableDataSource: NSObject , UITableViewDataSource,UITableViewDelegate{
    
    
    var dogs : [HomeDog]
    var coordinator : HomeDogCoordinator?
    
    init(dogs : [HomeDog]){
        self.dogs = dogs
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogCell", for: indexPath) as! HomeDogTableViewCell
        cell.dogImage.image = UIImage(named: dogs[indexPath.row].image)
        cell.dogTitle.text = dogs[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let coordinator = coordinator{
            coordinator.presentDogDetail(id: dogs[indexPath.row].id)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
