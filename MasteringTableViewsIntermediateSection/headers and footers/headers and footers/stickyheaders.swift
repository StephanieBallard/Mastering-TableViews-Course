//
//  stickyheaders.swift
//  headers and footers
//
//  Created by Stephanie Ballard on 3/9/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class StickyHeaders: UIViewController {
    let headerHeight: CGFloat = 200
    var headerView = UIView()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeader()
    }
    
    func configureHeader() {
        headerView = tableView.tableHeaderView!
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
    }
    
    func updateHeaderView() {
        var rect = CGRect(x: 0, y: -headerHeight, width: tableView.bounds.width, height: headerHeight)
        
        if tableView.contentOffset.y < -headerHeight {
            rect.origin.y = tableView.contentOffset.y
            rect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = rect
    }
}

extension StickyHeaders: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        cell.textLabel?.text = "Unicorn!"
        return cell
    }
}

extension StickyHeaders: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
}
