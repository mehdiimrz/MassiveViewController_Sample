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
    
    private lazy var dogsTable : UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .lightGray
        tableView.dataSource = self
        tableView.rowHeight = 110
        tableView.register(HomeDogTableViewCell.self, forCellReuseIdentifier: "DogCell")
        return tableView
    }()
    
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try dogsData = HomeDog.createHome()
            setup()
            
        } catch  {
            print("Error : \(error.localizedDescription)")
        }
    }
}

// MARK: Helper
extension HomeDogViewController{
    
    private func setup(){
        
        // TableView
        view.addSubview(dogsTable)
        dogsTable.constrainEdges(to: view)
        
    }
}

// MARK: TableView Datasource and Delegate
extension HomeDogViewController : UITableViewDataSource{
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
    
   
    
}

