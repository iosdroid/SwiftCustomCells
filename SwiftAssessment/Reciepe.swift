//
//  Reciepe.swift
//  SwiftAssessment
//
//  Created by Muthupalaniappan S on 06/04/17.
//  Copyright © 2017 sensiple. All rights reserved.
//

import Foundation
class Reciepe
{
    var name: String?
    var type: String?
    var amount: Int?
    var logoLocation : String?
    var topping = NSArray()
    var batters = NSDictionary()
    
    
        
    init(name: String, type: String,amount:Int,logoLocation:String,topping:NSArray,batters:NSDictionary)
    {
        self.name = name
        self.type = type
        self.amount = amount
        self.logoLocation = logoLocation
        self.topping = topping
        self.batters = batters
        
    }
    
    typealias RecipeDictionary = [String : AnyObject]
    
    init(recpDictionary: RecipeDictionary)
    {
        self.name = recpDictionary["name"] as? String
        self.type = recpDictionary["type"] as? String
        self.amount = recpDictionary["amount"]as? Int
        self.logoLocation = recpDictionary["logoLocation"] as? String
        self.topping = recpDictionary["topping"] as! NSArray
        self.batters = recpDictionary["batters"] as! NSDictionary
        
    }
    
    static func downloadAllRecipes() -> [Reciepe]
    {
        var recipes = [Reciepe]()
        
        let urlString = "http://beta.json-generator.com/api/json/get/Nk3q17Xhz"
        let  url = URL(string: urlString)
            if let jsonDictionary = NetworkService.parseJSONFromData(url) {
                let recpDictionaries = jsonDictionary["items"] as! [String:AnyObject]
                let itemDict = recpDictionaries["item"] as! [RecipeDictionary]
                for dict in itemDict {
                    let recipe = Reciepe(recpDictionary: dict)
                    recipes.append(recipe)
                }
        }
        return recipes
        
    }
}


