//
//  UIViewController+Extension.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/27/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /**
    Add child view controller to current view controller

    - Parameters:
       - child: Child view controller
    */
    func add(_ child: UIViewController) {
        addChild(child)

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    /**
    remove child view controller to current view controller

    - Parameters:
       - child: Child view controller
    */
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
