//
//  FlagCell.swift
//  Dynamic Cell Sizing
//
//  Created by Ben Sullivan on 05/12/2016.
//  Copyright © 2016 Sullivan Applications. All rights reserved.
//

import UIKit

class FlagCell: UITableViewCell {
	
	@IBOutlet weak var flag: UIImageView!

	func configureCell(country: Country) {
		
		flag.image = UIImage(named: country.flagSmall)
	}

}
