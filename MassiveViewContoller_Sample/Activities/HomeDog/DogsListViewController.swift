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
    
    weak var coordinator : HomeDogCoordinator?
    
    private lazy var dogsTable : UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .lightGray
        
        tableView.rowHeight = 110
        
        tableView.register(HomeDogTableViewCell.self, forCellReuseIdentifier: "DogCell")
        return tableView
    }()
    
    // MARK: Initializer
    
    init(dogs : [HomeDog]){
        self.dogs = dogs
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
        dogsTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dogsTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dogsTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dogsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
}

// MARK: TableView Datasource and Delegate
extension DogsListViewController : UITableViewDataSource,UITableViewDelegate{
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
        coordinator?.presentDogDetail(id: dogs[indexPath.row].id)
    }
}
