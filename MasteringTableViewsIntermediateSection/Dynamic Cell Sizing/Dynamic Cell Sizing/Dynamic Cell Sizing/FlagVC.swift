//
//  ViewController.swift
//  Dynamic Cell Sizing
//
//  Created by Ben Sullivan on 05/12/2016.
//  Copyright © 2016 Sullivan Applications. All rights reserved.
//

import UIKit

class FlagVC: UIViewController, DataService {
	
	@IBOutlet weak var tableView: UITableView!
	
	var countries = [Country]()
//  
//  In iOS, you can use Auto Layout to define the height of a table view cell; however, the feature is not enabled by default.
//  
//  Normally, a cell’s height is determined by the table view delegate’s tableView:heightForRowAtIndexPath: method. To enable self-sizing table view cells, you must set the table view’s rowHeight property to UITableViewAutomaticDimension. You must also assign a value to the estimatedRowHeight property. As soon as both of these properties are set, the system uses Auto Layout to calculate the row’s actual height.
//  
//  tableView.estimatedRowHeight = 85.0
//  tableView.rowHeight = UITableViewAutomaticDimension
  
//  Next, lay out the table view cell’s content within the cell’s content view. To define the cell’s height, you need an unbroken chain of constraints and views (with defined heights) to fill the area between the content view’s top edge and its bottom edge. If your views have intrinsic content heights, the system uses those values. If not, you must add the appropriate height constraints, either to the views or to the content view itself.
//  
//  Additionally, try to make the estimated row height as accurate as possible. The system calculates items such as the scroll bar heights based on these estimates. The more accurate the estimates, the more seamless the user experience becomes.
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		countries = createCountries()!
    
    //Demonstrate that using this function with images sizes the cells but not accurately enough
    //The cells are not quite big enough
    
    //uses auto layout
    //make it as accurate as possible
    tableView.estimatedRowHeight = 500
    tableView.rowHeight = UITableViewAutomaticDimension
    
    
  }
}

extension FlagVC: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return countries.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FlagCell
    
    cell.configureCell(country: countries[indexPath.row])
		
    return cell
	}
}

extension FlagVC: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		print("calculated cell", indexPath.row)
		
		let image = UIImage(named: countries[indexPath.row].flagSmall)!
		
		let aspect = view.frame.width / image.size.width
		
		return image.size.height * aspect
	}
}
