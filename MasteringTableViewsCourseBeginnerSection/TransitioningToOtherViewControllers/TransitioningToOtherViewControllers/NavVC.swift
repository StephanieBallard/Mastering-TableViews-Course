//
//  NavVC.swift
//  TransitioningToOtherViewControllers
//
//  Created by Stephanie Ballard on 3/5/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class NavVc: UIViewController {
    
    var checklist = ["Subclass UITableViewDatasource",
                     "Create a prototype cell",
                     "Set a unique reuse identifier",
                     "Wire the tableView to the ViewController",
                     "Add number of rows",
                     "Add cellForRowAt",
                     "Dequeue the cells"]
    
}

extension NavVc: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = checklist[indexPath.row]
        
        return cell
    }
}

extension NavVc: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "detail")
        
        //showing view controllers programatically
        navigationController?.pushViewController(vc, animated: true)
        // present(vc, animated: true)
    }
}
