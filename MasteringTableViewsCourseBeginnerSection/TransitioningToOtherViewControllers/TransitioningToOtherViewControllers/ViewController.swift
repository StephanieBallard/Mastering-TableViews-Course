//
//  ViewController.swift
//  TransitioningToOtherViewControllers
//
//  Created by Stephanie Ballard on 3/5/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var checklist = ["Subclass UITableViewDatasource",
                     "Create a prototype cell",
                     "Set a unique reuse identifier",
                     "Wire the tableView to the ViewController",
                     "Add number of rows",
                     "Add cellForRowAt",
                     "Dequeue the cells"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = checklist[indexPath.row]
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue1", sender: nil)
    }
}
