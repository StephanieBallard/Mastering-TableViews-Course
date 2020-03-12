//
//  ViewController.swift
//  Smooth Scrolling Large Images and Prefetching
//
//  Created by Stephanie Ballard on 3/12/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //  Note from the future: You will be asked to write a func called prefetchRowsAt which has the line self.view.frame.width.
     //  instead of doing this, put 'let viewWidth = self.view.frame.width' as the first line of the function and use viewWidth instead of self.view.frame.width. If this isn't clear then tweet me @MrMcSwiftface, thanks!
     
     let originalImages = [#imageLiteral(resourceName: "img1"), #imageLiteral(resourceName: "img2"), #imageLiteral(resourceName: "img3"), #imageLiteral(resourceName: "img4"), #imageLiteral(resourceName: "img5"), #imageLiteral(resourceName: "img6"), #imageLiteral(resourceName: "img7"), #imageLiteral(resourceName: "img8"), #imageLiteral(resourceName: "img9")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

