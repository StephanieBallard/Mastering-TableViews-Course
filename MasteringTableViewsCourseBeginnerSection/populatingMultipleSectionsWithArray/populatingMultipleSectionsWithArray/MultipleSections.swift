//
//  MultipleSections.swift
//  populatingMultipleSectionsWithArray
//
//  Created by Stephanie Ballard on 3/4/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class MultipleSections: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var fruit = [["Orange", "Apple", "Pear"], ["I", "Love", "Fruit!"], ["Hello", "World!"]]
    
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
    
    @IBAction func sortArray(_ sender: UIButton) {
        fruit[0].sort()
        // call reload data for the sort button to work. once the tableview has been populated you need to reload the data. the array will sort but wont show the changes in the table unless reload data is called.
        //tableView.reloadData()
        
        // if you only want to reload the one cell
        //let indexPath = IndexPath(row: 0, section: 0)
        // UITableView.RowAnimation can be removed for cleaner code.
        // this will make apple appear twice since we are only reloading the one cell, however this is how you reload one cell.
        //tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        
        // this will only reload the first section
        tableView.reloadSections([0], with: .fade)
    }
    
}

