//
//  Person.swift
//  SwiftAssessment
//
//  Created by Muthupalaniappan S on 07/04/17.
//  Copyright © 2017 sensiple. All rights reserved.
//

import Foundation
class Person
{
    var name: String?
    var dateOfBirth : String?
    var emergencyContacts = NSArray()
    var phones = NSDictionary()
    var email = NSArray()
    
    init(name: String, dateOfBirth: String,emergencyContacts:NSArray,phones:NSDictionary,email:NSArray)
    {
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.emergencyContacts = emergencyContacts
        self.phones = phones
        self.email = email
        
    }
    
    typealias PersonDictionary = [String : AnyObject]
    
    init(persDictionary: PersonDictionary)
    {
        self.emergencyContacts =  persDictionary["emergencyContacts"] as! NSArray//This is an array
        self.name = persDictionary["name"] as? String
        self.dateOfBirth = persDictionary["dateOfBirth"] as?String
        self.phones = persDictionary["phones"] as! NSDictionary
        self.email = persDictionary["email"] as! NSArray
        
        
    }
    static func downloadPersonDetails() -> [Person]
    {
        var person = [Person]()
        let urlString = "http://beta.json-generator.com/api/json/get/Nk3q17Xhz"
        let  url = URL(string: urlString)
        if let jsonDictionary = NetworkService.parseJSONFromData(url) {
            let persArray = jsonDictionary["person"] as! Dictionary<String,AnyObject>
            let pers = Person(persDictionary: persArray)
            person.append(pers)
        }
        return person
        
    }
    
}
