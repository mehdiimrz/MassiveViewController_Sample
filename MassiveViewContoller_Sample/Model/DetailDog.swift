//
//  DetailDog.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/26/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

struct DetailDog : Decodable,Identifiable{
    
    let id : Int
    let title : String
    let desc : String
    let image : String
    let group : String
    let height : String
    let weight : String
    let lifeSpan : String
    let coverImage : String
}


extension Array where Element == DetailDog{
    
    func findRndom(count : Int) -> [Element]{
        return self.pick(count)
    }
    
    func findDogWithId(dogId : Int) -> Element?{
        return self.filter{ $0.id == dogId }.first
        
    }
    
}
