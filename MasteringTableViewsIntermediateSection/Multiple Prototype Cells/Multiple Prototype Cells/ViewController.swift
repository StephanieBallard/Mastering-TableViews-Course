//
//  ViewController.swift
//  Multiple Prototype Cells
//
//  Created by Stephanie Ballard on 3/14/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

let knobs = [#imageLiteral(resourceName: "knob1"), #imageLiteral(resourceName: "knob2"), #imageLiteral(resourceName: "knob3"), #imageLiteral(resourceName: "knob4"), #imageLiteral(resourceName: "knob5"), #imageLiteral(resourceName: "knob6")]
let knockers = [#imageLiteral(resourceName: "knocker1"), #imageLiteral(resourceName: "knocker2"), #imageLiteral(resourceName: "knocker3"), #imageLiteral(resourceName: "knocker4"), #imageLiteral(resourceName: "knocker5")]

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return knobs.count
        case 1:
            return knockers.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "KnobCell", for: indexPath) as! KnobCell
            cell.knobImageView.image = knobs[indexPath.row]
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "KnockerCell", for: indexPath) as! KnockerCell
            cell.knockerImageView.image = knockers[indexPath.row]
            return cell
        default:
            break
        }
        
        return UITableViewCell()
    }
}
