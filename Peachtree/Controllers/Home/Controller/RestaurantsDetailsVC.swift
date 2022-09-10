//
//  RestaurantsDetailsVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class RestaurantsDetailsVC: UIViewController {
    @IBOutlet weak var stackVw: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()

    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUpUI() {
        for view: UIView in self.stackVw.subviews {
            if view.isKind(of: UIView.self) {
                view.backgroundColor = Colors.color_AppOrange
                view.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppOrange!)
            }
        }
    }
}
