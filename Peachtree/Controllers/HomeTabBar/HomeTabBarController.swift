//
//  HomeTabBarController.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {
    let layerGradient = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
    }
}
