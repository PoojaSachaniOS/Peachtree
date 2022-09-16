//
//  ContactUsVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class ContactUsVC: CustomBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupLeftBarButtonItem()
        self.navigationItem.title = "Contact Us"
        

    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
