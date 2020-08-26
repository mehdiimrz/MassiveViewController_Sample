//
//  ApplicationCoordinator.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/26/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation
import UIKit

final class HomeDogCoordinator : Coordinator{
    
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeDogViewController()
        navigationController.pushViewController(vc, animated: false)
    }
    
    
    func presentDogDetail(id : Int){
        
        let vc = DetailDogViewController(dogId: id)
        navigationController.topViewController?.present(vc, animated: true, completion: nil)

    }
}
