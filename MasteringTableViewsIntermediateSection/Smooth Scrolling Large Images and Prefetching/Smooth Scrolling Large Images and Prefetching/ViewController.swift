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
     
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateImages()
    }
    
    func populateImages() {
        let originalImages = [#imageLiteral(resourceName: "img1"), #imageLiteral(resourceName: "img2"), #imageLiteral(resourceName: "img3"), #imageLiteral(resourceName: "img4"), #imageLiteral(resourceName: "img5"), #imageLiteral(resourceName: "img6"), #imageLiteral(resourceName: "img7"), #imageLiteral(resourceName: "img8"), #imageLiteral(resourceName: "img9")]
        
        for i in originalImages {
            images.append(cacheImage(image: i))
        }
    }
    
    // This function is called on images before they are added to an array
    func cacheImage(image: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(image.size)
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: image.size)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? image
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ImageCell
        cell.setImage(image: images[indexPath.row])
        return cell
    }
}
