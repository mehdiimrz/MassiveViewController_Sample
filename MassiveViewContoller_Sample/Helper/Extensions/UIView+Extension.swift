//
//  UIView+Extension.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/25/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /**
    Activate constraint to edges.

    - Parameters:
       - view: Container view

    - Returns: Activated constraints
    */
    @discardableResult
    public func constrainEdges(to view: UIView) -> [NSLayoutConstraint] {
        let constraints = [
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    
    /**
    Activate constraint to the top with specific height.

    - Parameters:
       - view: Container view
       - height: Height of the view

    - Returns: Activated constraints
    */
    @discardableResult
    public func constrainTop(to view: UIView , withHeight height : CGFloat) -> [NSLayoutConstraint] {
        let constraints = [
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            heightAnchor.constraint(equalToConstant: height)
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    /**
    Activate constraint to the top with given view.

    - Parameters:
       - view: Container view
       - topView: Top view to stick

    - Returns: Activated constraints
    */
    @discardableResult
    public func constrainTop(to view: UIView , toTopView topView : UIView) -> [NSLayoutConstraint] {
        let constraints = [
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            topAnchor.constraint(equalTo: topView.bottomAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}
