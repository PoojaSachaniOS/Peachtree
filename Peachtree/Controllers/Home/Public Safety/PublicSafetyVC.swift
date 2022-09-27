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
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - OVERRIDE METHOD(S)
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setUpUI() {
        self.navigationItem.title = "Public Safety"
        super.setupLeftBarButtonItem()
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
    
}

//  MARK: - BUTTION ACTION(S)
extension PublicSafetyVC {
    @IBAction func btnPolicDepartTapped(_ sender: Any) {
        self.openWebViewVC("https://peachtree-city.org/117/Police", title: "Police")
    }
    
    @IBAction func btnFireEMSTapped(_ sender: Any) {
        self.openWebViewVC("https://peachtree-city.org/1061/Fire-EMS", title: "Fire & EMS")
    }
    
    func openWebViewVC(_ webUrl:String, title: String) {
        if let controller = StoryboardUtils.getWebViewVC() as? WebViewVC {
            controller.strWebUrl = webUrl
            controller.strNavTitle = title
            controller.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
