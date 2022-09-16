//
//  AppVersionVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class AppVersionVC: CustomBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "App Version"
        super.setupLeftBarButtonItem()

    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
