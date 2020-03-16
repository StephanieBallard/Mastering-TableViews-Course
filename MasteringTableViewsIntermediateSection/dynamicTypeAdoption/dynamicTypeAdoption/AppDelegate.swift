//
//  AppDelegate.swift
//  dynamicTypeAdoption
//
//  Created by Stephanie Ballard on 3/16/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

let text = ["A table view displays a list of items in a single column. UITableView is a subclass of UIScrollView, which allows users to scroll through the table, although UITableView allows vertical scrolling only. The cells comprising the individual items of the table are UITableViewCell objects; UITableView uses these objects to draw the visible rows of the table.", "Cells have content—titles and images—and can have, near the right edge, accessory views. Standard accessory views are disclosure indicators or detail disclosure buttons; the former leads to the next level in a data hierarchy and the latter leads to a detailed view of a selected item.","Accessory views can also be framework controls, such as switches and sliders, or can be custom views. Table views can enter an editing mode where users can insert, delete, and reorder rows of the table.","A table view is made up of zero or more sections, each with its own rows. Sections are identified by their index number within the table view, and rows are identified by their index number within a section. Any section can optionally be preceded by a section header, and optionally be followed by a section footer.",

"Table views can have one of two styles, plain and grouped."," When you create a UITableView instance you must specify a table style, and this style cannot be changed."," In the plain style, section headers and footers float above the content if the part of a complete section is visible. A table view can have an index that appears as a bar on the right hand side of the table."," You can touch a particular label to jump to the target section. The grouped style of table view provides a default background color and a default background view for all cells."," The background view provides a visual grouping for all cells in a particular section."," For example, one group could be a person's name and title, another group for phone numbers that the person uses, and another group for email accounts and so on. See the Settings application for examples of grouped tables."," Table views in the grouped style cannot have an index.",

"Many methods of UITableView take NSIndexPath objects as parameters and return values. UITableView declares a category on NSIndexPath that enables you to get the represented row index (row property) and section index (section property), and to construct an index path from a given row index and section index (init(row:section:) method). Especially in table views with multiple sections, you must evaluate the section index before identifying a row by its index number.",

"A UITableView object must have an object that acts as a data source and an object that acts as a delegate; typically these objects are either the application delegate or, more frequently, a custom UITableViewController object.","The data source must adopt the UITableViewDataSource protocol and the delegate must adopt the UITableViewDelegate protocol."," The data source provides information that UITableView needs to construct tables and manages the data model when rows of a table are inserted, deleted, or reordered. The delegate manages table row configuration and selection, row reordering, highlighting, accessory views, and editing operations.",

"When sent a setEditing(_:animated:) message (with a first parameter of true), the table view enters into editing mode where it shows the editing or reordering controls of each visible row, depending on the editingStyle of each associated UITableViewCell."," Clicking on the insertion or deletion control causes the data source to receive a tableView(_:commit:forRowAt:) message.","You commit a deletion or insertion by calling deleteRows(at:with:) or insertRows(at:with:), as appropriate. Also in editing mode, if a table-view cell has its showsReorderControl property set to true, the data source receives a tableView(_:moveRowAt:to:) message. The data source can selectively remove the reordering control for cells by implementing tableView(_:canMoveRowAt:)."]


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

