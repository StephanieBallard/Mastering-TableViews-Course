//
//  SecondViewController.swift
//  TableSegueToAnotherTable
//
//  Created by Stephanie Ballard on 3/11/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person?.friends.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondTableCell", for: indexPath)
        
        guard let friends = person?.friends else { return cell}
        
        cell.textLabel?.text = friends[indexPath.row].name
        return cell
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
