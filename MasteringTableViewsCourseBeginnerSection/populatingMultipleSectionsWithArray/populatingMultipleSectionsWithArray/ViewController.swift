//
//  ViewController.swift
//  populatingMultipleSectionsWithArray
//
//  Created by Stephanie Ballard on 3/4/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let fruit = [["Orange", "Apple", "Pear"], ["I", "Love", "Fruit!"], ["Hello", "World!"]]
    
    let headerText = ["Fruits", "What I love", "Textbook Text"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return fruit.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruit[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = fruit[indexPath.section][indexPath.row] //section zero, row zero, this gets called for each indexpath.row as the table view moves
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerText[section]
    }
}

