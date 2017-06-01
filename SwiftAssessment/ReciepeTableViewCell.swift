//
//  ReciepeTableViewCell.swift
//  SwiftAssessment
//
//  Created by Muthupalaniappan S on 06/04/17.
//  Copyright © 2017 sensiple. All rights reserved.
//

import UIKit

class ReciepeTableViewCell: UITableViewCell {
    var reciepe: Reciepe! {
        didSet {
            self.updateUI()
        }
    }
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var reciepeName: UILabel!
    @IBOutlet weak var reciepeTypeLabel: UILabel!
    @IBOutlet weak var reciepePriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func updateUI()
    {
        reciepeName.text = reciepe.name
        reciepeTypeLabel.text = reciepe.type
        reciepePriceLabel.text = String(describing: reciepe.amount!)
        let result = String(reciepe.logoLocation!.characters.dropFirst(13))
        recipeImageView.image = UIImage(named:result)?.circleMask
        
        
        cardView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 228/255.0, green: 228/255.0, blue: 228/255.0, alpha: 0.5)
        
        cardView.layer.cornerRadius = 5.0
        cardView.layer.masksToBounds = false
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardView.layer.borderWidth = 0.2
        
        cardView.layer.shadowColor = UIColor(red: 225/255.0, green: 228/255.0, blue: 228/255.0, alpha: 1.0).cgColor
        cardView.layer.shadowOffset = CGSize(width: 5.0, height:5.0)
        cardView.layer.shadowOpacity = 1.0
        cardView.layer.shadowRadius = 5.0
        
        
        
        
    }
    
}
