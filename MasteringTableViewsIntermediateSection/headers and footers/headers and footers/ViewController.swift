//
//  ViewController.swift
//  headers and footers
//
//  Created by Stephanie Ballard on 3/9/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let headerText = ["Header 1", "Header2", "Header 3", "Header 4"]

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
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerText.count
    }
}

extension ViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return headerText[section]
//    }
//
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
          return 28
      }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        let label = UILabel(frame: (CGRect(x: 10, y: 10, width: 100, height: 20)))
        label.text = headerText[section]
        header.addSubview(label)
        header.backgroundColor = .white
        return header
    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 28
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footer = UIView()
//        footer.backgroundColor = .red
//        return footer
//    }
}
