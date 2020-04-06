//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Takudzwa Mupanesure on 15/03/2020.
//  Copyright © 2020 Takudzwa Mupanesure. All rights reserved.
//

import Foundation
import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet private var photo: UIImageView!
    @IBOutlet private var nameLabel: UILabel!

        func configurateTheCell(_ style: Country) {
            nameLabel.text = style.name
            photo.image = UIImage(named: style.photo)
        }
    
}
