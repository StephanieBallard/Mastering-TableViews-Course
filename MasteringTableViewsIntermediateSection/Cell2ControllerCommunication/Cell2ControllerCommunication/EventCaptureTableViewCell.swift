//
//  EventCaptureTableViewCell.swift
//  Cell2ControllerCommunication
//
//  Created by Stephanie Ballard on 3/11/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class EventCaptureTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: ViewController?
    
    @IBAction func tapMeButtonTapped(_ sender: UIButton) {
        guard let text = textField.text else { return }
        delegate?.setNavBarTitle(to: text)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
