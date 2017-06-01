//
//  ReciepeDetailViewController.swift
//  SwiftAssessment
//
//  Created by Muthupalaniappan S on 10/04/17.
//  Copyright © 2017 sensiple. All rights reserved.
//

import UIKit

class ReciepeDetailViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var reciepeNameLabel: UILabel!
    @IBOutlet weak var reciepeDetialimageView: UIImageView!
    @IBOutlet weak var reciepeamountLabel: UILabel!
    @IBOutlet weak var reciepeTypeLabel: UILabel!
    
    @IBOutlet weak var toppingPicker: UIPickerView!
    
    @IBOutlet weak var battersPicker: UIPickerView!
    var reciepe: Reciepe!
    override func viewDidLoad() {
        
        title = reciepe.name!
        let result = String(reciepe.logoLocation!.characters.dropFirst(13))
        reciepeDetialimageView.image = UIImage(named:result)
        reciepeNameLabel.text = reciepe.name!
        reciepeTypeLabel.text = reciepe.type!
        reciepeamountLabel.text = String(describing: reciepe.amount!)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 10:
          return  reciepe.topping.count
        
        case 20:
           
            
        let batters = reciepe.batters["batter"] as! NSArray
            return batters.count
        default:
          return  0
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        switch pickerView.tag {
        case 10:
            let toppings = reciepe.topping[row] as! NSDictionary
            
            return toppings["type"] as? String
        case 20:
             let batters = reciepe.batters["batter"] as! NSArray
             let batter = batters[row] as! NSDictionary
             
             return batter["type"] as? String
            
        default:
            return nil
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
  
    @IBAction func buyNowButtonAction(_ sender: Any) {
        
        alert(message: "Thank You for Purchasing Your Order Placed Successfully", title: "Summary")
        
    }
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            _ = self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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
