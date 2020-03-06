//
//  DetailVC.swift
//  Dynamic Cell Sizing
//
//  Created by Ben Sullivan on 05/12/2016.
//  Copyright © 2016 Sullivan Applications. All rights reserved.
// 

import UIKit

class DetailVC: UIViewController {
	
	@IBOutlet weak var detailText: UILabel!
	
	internal var latinText: String? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		detailText.text = latinText!
	}
	
}
