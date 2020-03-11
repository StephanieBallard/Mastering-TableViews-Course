//
//  DetailVC.swift
//  PassingDataToOTherViewControllers
//
//  Created by Stephanie Ballard on 3/11/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var textToDisplay: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = textToDisplay
    }
}
