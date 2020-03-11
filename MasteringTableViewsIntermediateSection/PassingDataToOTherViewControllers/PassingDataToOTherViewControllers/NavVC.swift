//
//  nav.swift
//  PassingDataToOTherViewControllers
//
//  Created by Stephanie Ballard on 3/11/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class NavVC: UIViewController {
  
  var emojis = allEmojis
}

extension NavVC: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return emojis.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = emojis[indexPath.row]
    
    return cell
    
  }
}

extension NavVC: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    let vc = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailVC
    vc.textToDisplay = emojis[indexPath.row]
    
    navigationController?.pushViewController(vc, animated: true)
  }
}
