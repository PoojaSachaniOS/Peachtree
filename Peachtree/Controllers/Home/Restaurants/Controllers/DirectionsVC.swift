//
//  DirectionsVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 12/09/22.
//

import UIKit
class DirectionsVC: CustomBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Norma Stitts "
        super.configureLeftBarButtonItem()
        self.setNeedsStatusBarAppearanceUpdate()
     }
       
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func btnBackTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
