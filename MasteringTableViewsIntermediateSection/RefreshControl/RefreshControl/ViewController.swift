//
//  ViewController.swift
//  RefreshControl
//
//  Created by Stephanie Ballard on 3/11/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    var letters = ["s","t","e","p","h"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Let's refresh!")
        
        refreshControl.addTarget(nil, action: #selector(didRefresh), for: UIControl.Event.allEvents)
        
        refreshControl.tintColor = .blue
        
        tableView.refreshControl = refreshControl
    }
    
    @objc func didRefresh() {
        print("Refresh")
        
        letters.sort()
        tableView.reloadData()
        
        //refreshControl.beginRefreshing()
        refreshControl.endRefreshing()
        //refreshControl.isRefreshing //change add target for: .allEvents to .valueChanged.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return letters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = letters[indexPath.row]
        return cell
    }
}
