//
//  FlagCell.swift
//  CustomCells
//
//  Created by Stephanie Ballard on 3/5/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class FlagCell: UITableViewCell {
    
    var country: Country! {
        didSet {
            configureCell()
        }
    }
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    @IBAction func togglePressed(_ sender: UIButton) {
        countryName.text = countryName.text == country.name ? country.cont.rawValue : country.name
        
    }
    
    func configureCell() {
        countryName.text = country.name
        flagImage.image = UIImage(named: country.flagSmall)
    }
}
