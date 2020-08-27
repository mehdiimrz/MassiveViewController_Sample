//
//  DogsListViewController.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/26/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import UIKit

class DogsListViewController: UIViewController {
    
    // MARK: Properties
    private var dogs = [HomeDog](){
        didSet{
            DispatchQueue.main.async {
                self.dogsTable.reloadData()
            }
            
        }
    }
    
    weak var coordinator : HomeDogCoordinator?{
        didSet{
            dataSource.coordinator = coordinator
        }
    }
    
    private let dataSource : DogsTableDataSource
    
    private lazy var dogsTable : UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.backgroundColor = .lightGray
        
        tableView.rowHeight = 110
        
        tableView.register(HomeDogTableViewCell.self, forCellReuseIdentifier: "DogCell")
        return tableView
    }()
    
    // MARK: Initializer
    
    init(dogs : [HomeDog]){
        self.dogs = dogs
        self.dataSource = DogsTableDataSource(dogs: dogs)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        setupViews()
    }
    
    
    private func setupViews(){
        // TableView
        view.addSubview(dogsTable)
        dogsTable.constrainEdges(to: view)        
    }
    
}
