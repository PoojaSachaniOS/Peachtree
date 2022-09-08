//
//  PublicSafetyVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 08/09/22.
//

import UIKit

class PublicSafetyVC: UIViewController {
    // MARK: - IB-OUTLET(S)

    @IBOutlet weak var vwFireDirection: UIView!
    @IBOutlet weak var vwPublicDirection: UIView!
    @IBOutlet weak var StackViewFireAndEMS: UIStackView!
    @IBOutlet weak var stackViewPublic: UIStackView!
    @IBOutlet weak var mainV: UIView!
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        for view: UIView in self.stackViewPublic.subviews {
            if (view is UIView) {
                let vw: UIView? = (view as? UIView)
                vw?.backgroundColor = Colors.color_AppOrange
                vw?.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppThemeBlack!)
            }
        }
        for view: UIView in self.StackViewFireAndEMS.subviews {
            if (view is UIView) {
                let vw: UIView? = (view as? UIView)
                vw?.backgroundColor = Colors.color_AppOrange
                vw?.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppThemeBlack!)
            }
        }
        self.vwFireDirection.addRoundedViewCorners(width: 8, colorBorder: Colors.color_AppThemeBlack!, BackgroundColor: UIColor.white)
        self.vwPublicDirection.addRoundedViewCorners(width: 8, colorBorder: Colors.color_AppThemeBlack!, BackgroundColor: UIColor.white)

    }
    

}
