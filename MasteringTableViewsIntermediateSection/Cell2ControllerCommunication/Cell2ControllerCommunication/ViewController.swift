//
//  ViewController.swift
//  Cell2ControllerCommunication
//
//  Created by Stephanie Ballard on 3/11/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

protocol CelltoControllerDelegate: class {
    func setNavBarTitle(to text: String)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EventCaptureTableViewCell
        cell.delegate = self
        return cell
    }
}

extension ViewController: CelltoControllerDelegate {
    func setNavBarTitle(to text: String) {
        navigationItem.title = text
    }
}

// create protocol, view controller conforms to it, set delegate to self and the delegate is a property on the cell
