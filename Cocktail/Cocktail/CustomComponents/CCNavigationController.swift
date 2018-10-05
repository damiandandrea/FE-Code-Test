//
//  CCNavigationController.swift
//

import Foundation
import UIKit

class CCNavigationController: UINavigationController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationBar.isTranslucent = false

        //Title
        let font: UIFont = UIFont(name: "Avenir-Book", size: 16.0)!
        let color: UIColor = UIColor.white
        self.navigationBar.titleTextAttributes = [NSFontAttributeName: font,
                                                  NSForegroundColorAttributeName: color]
        
        //Background
        navigationBar.barTintColor = UIColor(rgba: Constants.Colors.primaryColor)

        //Bottom line color
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 0.5))
        let ctx = UIGraphicsGetCurrentContext()
        UIColor(rgba: Constants.Colors.primaryColor).setFill()
        ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 0.5))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = image
    }

}
