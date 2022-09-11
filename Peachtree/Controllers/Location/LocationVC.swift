//
//  LocationVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

class LocationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
