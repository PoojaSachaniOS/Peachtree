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

//        layerGradient.colors = [UIColor.black.cgColor, UIColor.black.cgColor]
//        layerGradient.startPoint = CGPoint(x: 0, y: 0.5)
//        layerGradient.endPoint = CGPoint(x: 1, y: 0.5)
//        layerGradient.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
//        self.tabBar.layer.insertSublayer(layerGradient, at: 0)
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
       
        
    }

   

}
