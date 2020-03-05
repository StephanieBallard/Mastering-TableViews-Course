//
//  ViewController.swift
//  Styles&Accessories
//
//  Created by Stephanie Ballard on 3/5/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Accessorize me!"
        cell.detailTextLabel?.text = "My Detail"
        
        switch indexPath.row {
        case 0:
            cell.accessoryType = .checkmark
        case 1:
            cell.accessoryType = .detailButton
        case 2:
            cell.accessoryType = .detailDisclosureButton
        case 3:
            cell.accessoryType = .disclosureIndicator
        case 4:
            cell.accessoryType = .none
        default:
            break
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print(indexPath.row, "was selected")
    }
}
