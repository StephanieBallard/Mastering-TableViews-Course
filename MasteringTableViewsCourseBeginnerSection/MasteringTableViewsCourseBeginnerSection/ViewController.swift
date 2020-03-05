//
//  ViewController.swift
//  MasteringTableViewsCourseBeginnerSection
//
//  Created by Stephanie Ballard on 3/4/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
        override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "My first table view!"
        return cell
    }
    

}

