//
//  AppVersionVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class AppVersionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
