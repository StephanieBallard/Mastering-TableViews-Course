//
//  prefetchVC.swift
//  Smooth Scrolling Large Images and Prefetching
//
//  Created by Stephanie Ballard on 3/12/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class PrefetchVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var images = [#imageLiteral(resourceName: "4c"), #imageLiteral(resourceName: "img2"), #imageLiteral(resourceName: "img3"), #imageLiteral(resourceName: "img4"), #imageLiteral(resourceName: "img5"), #imageLiteral(resourceName: "img6"), #imageLiteral(resourceName: "img7"), #imageLiteral(resourceName: "img8"), #imageLiteral(resourceName: "img9"), #imageLiteral(resourceName: "1c"),#imageLiteral(resourceName: "2c"),#imageLiteral(resourceName: "3c"),#imageLiteral(resourceName: "4c"),#imageLiteral(resourceName: "5c"),#imageLiteral(resourceName: "6c"),#imageLiteral(resourceName: "7c"),#imageLiteral(resourceName: "8c"),#imageLiteral(resourceName: "9c")]
    var prefetchedTracker = Set<IndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.prefetchDataSource.self
        //populateImages()
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

extension PrefetchVC: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let viewWidth = self.view.frame.width
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            for i in indexPaths {
                print("prefetching", i.row)
                
                if !self.prefetchedTracker.contains(i) {
                    self.prefetchedTracker.insert(i)
                    let cachedImage = resizeImage(image: self.images[i.row], newWidth: viewWidth)
                    
                    self.images.remove(at: i.row)
                    self.images.insert(cachedImage, at: i.row)
                }
            }
        }
    }
}

extension PrefetchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ImageCell
        cell.setImage(image: images[indexPath.row])
        return cell
    }
}

extension PrefetchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let image = images[indexPath.row]
        let aspect = view.frame.width / image.size.width
        
        return image.size.height * aspect
    }
}
