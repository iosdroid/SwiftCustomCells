//
//  PersonViewController.swift
//  SwiftAssessment
//
//  Created by Muthupalaniappan S on 10/04/17.
//  Copyright © 2017 sensiple. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var persEmailLabel: UILabel!
    @IBOutlet weak var companyEmailLabel: UILabel!
    @IBOutlet weak var homePhoneLabel: UILabel!
    @IBOutlet weak var mobilePhoneLabel: UILabel!
    var persons = [Person]()
    @IBOutlet weak var emgContactsNameLabel: UILabel!
    
    @IBOutlet weak var emgContactsPhoneLabel: UILabel!
    
    override func viewDidLoad() {
        self.persons = Person.downloadPersonDetails()
        super.viewDidLoad()
        personImageView.image =  UIImage(named:"user")?.circleMask
        nameLabel.text = self.persons[0].name
        dobLabel.text = String(self.persons[0].dateOfBirth!.characters.dropLast(14))
        
        let emails = self.persons[0].email 
        
        persEmailLabel.text = emails[0] as? String
        companyEmailLabel.text = emails[1] as? String
        
        let phones = self.persons[0].phones
        
        homePhoneLabel.text = phones["home"] as? String
        
        mobilePhoneLabel.text = phones["mobile"] as? String
        
        let emergencyContacts = self.persons[0].emergencyContacts[0] as! NSDictionary
        
        emgContactsNameLabel.text = emergencyContacts["name"] as? String
        emgContactsPhoneLabel.text = emergencyContacts["phone"] as? String
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
