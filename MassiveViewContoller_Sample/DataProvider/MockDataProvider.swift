//
//  MockDataProvider.swift
//  MassiveViewContoller_Sample
//
//  Created by Mehdi-Mac on 8/26/20.
//  Copyright © 2020 Mehdiimrz. All rights reserved.
//

import Foundation

class MockDataProvider : DataProvider{
    
    func getHomeDogs() -> [HomeDog] {
        if let filepath = Bundle.main.path(forResource: "DogHomeJson", ofType: "json") {
            do {
                
                let fileUrl = URL(fileURLWithPath: filepath)
                let data = try Data(contentsOf: fileUrl)
                let dogs = try JSONDecoder().decode([HomeDog].self, from: data)
                return dogs
                
            } catch {
                return [HomeDog]()
            }
        } else {
            return [HomeDog]()
        }
    }
    
    func getDetailDogs() -> [DetailDog] {
        if let filepath = Bundle.main.path(forResource: "DogDetailJson", ofType: "json") {
            do {
                
                let fileUrl = URL(fileURLWithPath: filepath)
                let data = try Data(contentsOf: fileUrl)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let dogs = try jsonDecoder.decode([DetailDog].self, from: data)
                return dogs
                
                
            } catch {
                return [DetailDog]()
            }
        } else {
            return [DetailDog]()
        }
    }
    
    
    
    
}
