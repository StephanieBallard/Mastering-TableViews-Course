//
//  ViewController.swift
//  editing and reordering
//
//  Created by Stephanie Ballard on 3/10/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func refreshTable(_ sender: UIBarButtonItem) {
        //tableView.reloadData()
        
        // inserting and deleting into our table
        let ip = IndexPath(row: 2, section: 0)
        let ip2 = IndexPath(row: 5, section: 0)
        
        emojis.insert("Hello!", at: ip.row)
        tableView.insertRows(at: [ip], with: .fade)
        
        emojis.remove(at: ip2.row)
        tableView.deleteRows(at: [ip2], with: .fade)
    }
    
    var emojis = allEmojis
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if this is changed to false, swipe to delete instead of button bc we have editing style down in the UITableViewDelegate :
//        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//               if editingStyle == .delete {
//                   emojis.remove(at: indexPath.row)
//                   tableView.deleteRows(at: [indexPath], with: .left)
//               }
        tableView.isEditing = false
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = emojis[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    //edit the rows
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            emojis.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .left)
//        }
//    }
    
    // to change the name of the delete button to say remove instead.
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }
    
    // re-ordering
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let source = emojis[sourceIndexPath.row]
        emojis.remove(at: sourceIndexPath.row)
        emojis.insert(source, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Del") { _, _ in
            
            if let _ = tableView.cellForRow(at: indexPath) {
            self.emojis.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { _, _ in
            print("Favorite")
        }
        favorite.backgroundColor = .blue
        
        let more = UITableViewRowAction(style: .default, title: "More") { _, _ in
            print("More")
        }
        return [delete, more, favorite]
}
}
