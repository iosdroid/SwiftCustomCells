//
//  ReciepeViewController.swift
//  SwiftAssessment
//
//  Created by Muthupalaniappan S on 10/04/17.
//  Copyright © 2017 sensiple. All rights reserved.
//

import UIKit

class ReciepeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var reciepes = [Reciepe]()
     let SegueDetailViewController = "reciepeDetailSegue"
    
     
    
    @IBOutlet weak var reciepeTableView: UITableView!
    //var reciepeImageArray = ["donutAppleFritter", "donutCake", "donutFilled","donutOldFashioned", "donutRaised"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reciepes"
        reciepeTableView.rowHeight = 165
        reciepeTableView.separatorStyle = .none
        
        self.reciepes = Reciepe.downloadAllRecipes()
        
        self.reciepeTableView.reloadData()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
    // MARK: - Table view data source
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return reciepes.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Recipe Cell", for: indexPath) as! ReciepeTableViewCell
        let reciepe = self.reciepes[indexPath.row]
        cell.reciepe = reciepe
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath)
    {
        
        
        performSegue(withIdentifier: SegueDetailViewController, sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueDetailViewController {
            if let indexPath = reciepeTableView.indexPathForSelectedRow{
                let destinationViewController = segue.destination as! ReciepeDetailViewController
                destinationViewController.reciepe = reciepes[indexPath.row]
            }
        }

    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
