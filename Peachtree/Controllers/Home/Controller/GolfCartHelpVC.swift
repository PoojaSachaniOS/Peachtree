//
//  GolfCartHelpVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class GolfCartHelpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
