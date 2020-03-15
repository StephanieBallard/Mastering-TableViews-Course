//
//  ViewController.swift
//  SearchBar
//
//  Created by Stephanie Ballard on 3/14/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var letters = ["S", "T", "E", "P", "H"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchBar()
    }

    func configureSearchBar() {
        let offset = CGPoint(x: 0, y: 44)
        tableView.setContentOffset(offset, animated: false)
        searchController.searchBar.delegate = self
        tableView.tableHeaderView = searchController.searchBar
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

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if letters.contains(searchBar.text!) {
            letters = letters.filter { searchBar.text?.lowercased() == $0.lowercased() }
            tableView.reloadData()
        }
    }
}
