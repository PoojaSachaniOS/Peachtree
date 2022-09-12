//
//  DirectionsVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 12/09/22.
//

import UIKit



class DirectionsVC: UIViewController {
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
     }
       
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
