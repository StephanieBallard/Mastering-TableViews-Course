//
//  ImageCell.swift
//  Smooth Scrolling Large Images and Prefetching
//
//  Created by Stephanie Ballard on 3/12/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    func setImage(image: UIImage) {
        mainImageView.image = image
    }
}
