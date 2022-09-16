//
//  GolfCartHelpVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class GolfCartHelpVC: CustomBaseVC {
    //  MARK: - IB-OUTLET(S)
    @IBOutlet weak var stackVw: UIStackView!
    @IBOutlet weak var lblDescrptn: LBSatoshiRegularLightGrey14!
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - OVERRIDE METHOD(S)
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //  MARK: - PRIVATE METHOD(S)
    private func setUpUI() {
        super.setupLeftBarButtonItem()
        self.navigationItem.title = "Golf Cart Help"
        for view: UIView in self.stackVw.subviews {
            if view.isKind(of: UIView.self) {
                view.backgroundColor = Colors.color_AppOrange
                view.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppOrange!)
            }
        }
        
        self.lblDescrptn.setLineSpacing(lineSpacing: 2.5, lineHeightMultiple: 0)
    }
}
