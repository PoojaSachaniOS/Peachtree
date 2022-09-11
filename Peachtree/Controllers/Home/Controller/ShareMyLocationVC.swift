//
//  ShareMyLocationVC.swift
//  Peachtree
//
//  Created by Anand on 11/09/22.
//

import UIKit

class ShareMyLocationVC: UIViewController {
    @IBOutlet weak var stackVw: UIStackView!

    @IBOutlet weak var vwOuterBgDropPin: UIView!
    @IBOutlet weak var vwInnerBgDropPin: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUpUI() {
        for view: UIView in self.stackVw.subviews {
            if view.isKind(of: UIView.self) {
                view.backgroundColor = Colors.color_AppOrange
                view.addRoundedViewCorners(width: 8, colorBorder: UIColor.white, BackgroundColor: UIColor.white.withAlphaComponent(0.4))
            }
        }
        stackVw.backgroundColor = Colors.color_AppOrange
        
        vwOuterBgDropPin.addRoundedViewCorners(width: vwOuterBgDropPin.frame.size.height/2, colorBorder: .clear, BackgroundColor: (Colors.color_AppOrange?.withAlphaComponent(0.28))!)
        vwInnerBgDropPin.addRoundedViewCorners(width: vwInnerBgDropPin.frame.size.height/2, colorBorder: .white, BackgroundColor: (Colors.color_AppOrange)!)

    }
}
