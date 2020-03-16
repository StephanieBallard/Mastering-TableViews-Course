//
//  FlagCell.swift
//  Dynamic Cell Sizing
//
//  Created by Stephanie Ballard on 3/16/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class FlagCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    
    func configureCell(country: Country) {
        flagImageView.image = UIImage(named: country.flagSmall)
    }
}
