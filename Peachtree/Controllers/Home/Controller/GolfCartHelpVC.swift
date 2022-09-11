//
//  GolfCartHelpVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class GolfCartHelpVC: UIViewController {
    @IBOutlet weak var stackVw: UIStackView!
    @IBOutlet weak var lblDescrptn: LBSatoshiRegularLightGrey14!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setNeedsStatusBarAppearanceUpdate()

    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
        
        self.lblDescrptn.setLineSpacing(lineSpacing: 2.5, lineHeightMultiple: 0)

    }
}
