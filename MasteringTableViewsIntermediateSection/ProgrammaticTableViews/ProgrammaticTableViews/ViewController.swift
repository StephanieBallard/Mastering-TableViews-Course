//
//  ViewController.swift
//  ProgrammaticTableViews
//
//  Created by Stephanie Ballard on 3/16/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
}

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    let data = ["dog", "cat", "cat", "cat", "dog", "dog"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(MyCell.self, forCellReuseIdentifier: "MyCell")
        tableView.frame = view.frame
        view.addSubview(tableView)
        
        navigationItem.title = "SUCCESS"
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let value = data[indexPath.row]
        switch value {
        case "dog":
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "DOG CELL"
            return cell
        case "cat":
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            cell.textLabel?.text = "CAT CELL"
            return cell
        default: return UITableViewCell()
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = "programmtic cell"
//        return cell
    }
}
