//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Takudzwa Mupanesure on 15/03/2020.
//  Copyright © 2020 Takudzwa Mupanesure. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var styleInfoLabel: UILabel!
    
    var style: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let style = style {
            nameLabel.text = style.name
            imageView.image = UIImage(named: style.photo)
            styleInfoLabel.text = style.details
            styleInfoLabel.numberOfLines = 0
        }
    }
}

