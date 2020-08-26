//
//  Coordinator.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/26/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    
    var navigationController: UINavigationController { get set }
    func start()
    
}
