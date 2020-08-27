//
//  Array+Extension.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/26/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

extension Array where Element == DetailDog{
    /**
    Return random element of array

    - Parameters:
       - n: Number of random Element
    */
    func findRndom(count : Int) -> [Element]{
        return self.pick(count)
    }
    
    private func pick(_ n: Int) -> [Element] {
        guard count >= n else {
            fatalError("The count has to be at least \(n)")
        }
        guard n >= 0 else {
            fatalError("The number of elements to be picked must be positive")
        }

        let shuffledIndices = indices.shuffled().prefix(upTo: n)
        return shuffledIndices.map {self[$0]}
    }
    
    
    /**
    Return Dog object with given id

    - Parameters:
       - dogId: Identifier of dog object
    */
    func findDogWithId(dogId : Int) -> Element?{
        return self.filter{ $0.id == dogId }.first
        
    }
    
}
