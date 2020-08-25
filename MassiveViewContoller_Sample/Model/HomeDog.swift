//
//  HomeDog.swift
//  FixMassiveViewController_MVC
//
//  Created by Mehdi-Mac on 8/21/20.
//  Copyright © 2020 Mehdi-Mac. All rights reserved.
//

import Foundation


struct HomeDog : Decodable{
    
    var id : Int
    var title : String
    var desc : String
    var image : String
    
    
    
    static func createHome() throws -> [HomeDog]{
        if let filepath = Bundle.main.path(forResource: "DogHomeJson", ofType: "json") {
            do {
                
                let fileUrl = URL(fileURLWithPath: filepath)
                let data = try Data(contentsOf: fileUrl)
                let dogs = try JSONDecoder().decode([HomeDog].self, from: data)
                return dogs
                
            } catch {
                throw error
            }
        } else {
            throw NSError.init(domain: "File not found", code: 0, userInfo: nil)
        }
    }
}
