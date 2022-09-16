//
//  AppVersionVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class AppVersionVC: CustomBaseVC {
    //  MARK: - IB-OUTLET(S)
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "App Version"
        super.setupLeftBarButtonItem()
    }
}
