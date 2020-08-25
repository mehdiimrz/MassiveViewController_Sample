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
        tableView.rowHeight = 110
        tableView.register(HomeDogTableViewCell.self, forCellReuseIdentifier: "DogCell")
        return tableView
    }()
    
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        do {
            try dogsData = HomeDog.createHome()
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
