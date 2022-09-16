//
//  PublicSafetyVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 08/09/22.
//

import UIKit

class PublicSafetyVC: CustomBaseVC {
    // MARK: - IB-OUTLET(S)
    @IBOutlet weak var vwFireDirection: UIView!
    @IBOutlet weak var vwPublicDirection: UIView!
    @IBOutlet weak var StackViewFireAndEMS: UIStackView!
    @IBOutlet weak var stackViewPublic: UIStackView!
    @IBOutlet weak var mainV: UIView!
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Public Safety"
        super.setupLeftBarButtonItem()
        setUpUI()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func setUpUI() {
        for view: UIView in self.stackViewPublic.subviews {
            if view.isKind(of: UIView.self) {
                view.backgroundColor = Colors.color_AppOrange
                view.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppOrange!)
            }
        }
        for view: UIView in self.StackViewFireAndEMS.subviews {
            if view.isKind(of: UIView.self) {
                view.backgroundColor = Colors.color_AppOrange
                view.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppOrange!)
            }
        }
        self.vwFireDirection.addRoundedViewCorners(width: 8, colorBorder: Colors.color_borderLightBlack!, BackgroundColor: UIColor.white)
        self.vwPublicDirection.addRoundedViewCorners(width: 8, colorBorder: Colors.color_borderLightBlack!, BackgroundColor: UIColor.white)
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
