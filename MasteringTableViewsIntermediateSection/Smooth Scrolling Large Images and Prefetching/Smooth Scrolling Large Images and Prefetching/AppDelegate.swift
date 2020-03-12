//
//  AppDelegate.swift
//  Smooth Scrolling Large Images and Prefetching
//
//  Created by Stephanie Ballard on 3/12/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var images = [#imageLiteral(resourceName: "4c"), #imageLiteral(resourceName: "img2"), #imageLiteral(resourceName: "img3"), #imageLiteral(resourceName: "img4"), #imageLiteral(resourceName: "img5"), #imageLiteral(resourceName: "img6"), #imageLiteral(resourceName: "img7"), #imageLiteral(resourceName: "img8"), #imageLiteral(resourceName: "img9"), #imageLiteral(resourceName: "1c"),#imageLiteral(resourceName: "2c"),#imageLiteral(resourceName: "3c"),#imageLiteral(resourceName: "4c"),#imageLiteral(resourceName: "5c"),#imageLiteral(resourceName: "6c"),#imageLiteral(resourceName: "7c"),#imageLiteral(resourceName: "8c"),#imageLiteral(resourceName: "9c")]

    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
      
      let scale = newWidth / image.size.width
      let newHeight = image.size.height * scale
      UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
      image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
      let newImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      
      return newImage!
    }

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

