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
    
    // Return all of the Dogs
    private static func dogsDetails() throws -> [DetailDog]{
        if let filepath = Bundle.main.path(forResource: "DogDetailJson", ofType: "json") {
                   do {
                       
                       let fileUrl = URL(fileURLWithPath: filepath)
                       let data = try Data(contentsOf: fileUrl)
                       let jsonDecoder = JSONDecoder()
                       jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                       let dogs = try jsonDecoder.decode([DetailDog].self, from: data)
                       return dogs
                       
                       
                   } catch {
                       throw error
                   }
               } else {
                   throw NSError.init(domain: "File not found", code: 0, userInfo: nil)
               }
    }
    
    // Return a Dog with given ID
    static func findDetail(dogId : Int) throws -> DetailDog{
        do{
            var dogs = try self.dogsDetails()
            dogs = dogs.filter{ $0.id == dogId }
            if let foundDog = dogs.first{
                return foundDog
            }else{
                throw NSError.init(domain: "Dog not found", code: 0, userInfo: nil)
            }
            
        } catch{
            throw error
        }
    }
    
}

