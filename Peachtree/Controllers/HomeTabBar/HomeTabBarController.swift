//
//  HomeTabBarController.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit
import SwiftUI

class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {
    let layerGradient = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.selectedIndex = 2
      /*  self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: FontHelper.AppFont.fontSatoshiRegular, size: 30)!], for: .normal)
        self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: FontHelper.AppFont.fontSatoshiRegular, size: 30)!], for: .selected)*/
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
    }
}
