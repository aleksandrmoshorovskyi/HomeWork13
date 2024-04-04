//
//  CatalogTableViewCell.swift
//  Lesson13HW
//
//  Created by Aleksandr Moroshovskyi on 04.04.2024.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mmLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceCurrencyLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBAction func favoriteButtonAction(_ sender: Any) {
        //debugPrint("favoriteButtonAction")
        favoriteButtonActionCompletion?()
    }
    
    var favoriteButtonActionCompletion: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .systemGray6
    }
}
