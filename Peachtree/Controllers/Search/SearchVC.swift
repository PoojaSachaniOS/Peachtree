//
//  SearchVC.swift
//  Peachtree
//
//  Created by Anand on 01/09/22.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var stackVw: UIStackView!
    @IBOutlet weak var btnCategories: UIButton!
    @IBOutlet weak var btnAddress: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
    }
    
    func initializeUI() {
        for view: UIView in self.stackVw.subviews {
            if (view is UIButton) {
                let btn: UIButton? = (view as? UIButton)
                btn?.titleLabel?.font = FontHelper.defaultSatoshiBoldFontWithSize(size: 16)
            }
        }
        
        btnAddress.isSelected = true
        btnCategories.isSelected = false
        self.configureButtons()
    }
    
    func configureButtons() {
        btnAddress?.titleLabel?.font = FontHelper.defaultSatoshiBoldFontWithSize(size: 16)
        btnCategories?.titleLabel?.font = FontHelper.defaultSatoshiBoldFontWithSize(size: 16)

        if btnAddress.isSelected {
            btnAddress.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppOrange!, BackgroundColor: Colors.color_AppOrange!)
            btnAddress.setTitleColor(.white, for: .normal)
                        
            btnCategories.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppThemeBlack!, BackgroundColor: .white)
            btnCategories.setTitleColor(Colors.color_AppThemeBlack, for: .normal)
        } else {
            
            btnCategories.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppOrange!, BackgroundColor: Colors.color_AppOrange!)
            btnCategories.setTitleColor(.white, for: .normal)
                        
            btnAddress.addRoundedViewCorners(width: 4, colorBorder: Colors.color_AppThemeBlack!, BackgroundColor: .white)
            btnAddress.setTitleColor(Colors.color_AppThemeBlack, for: .normal)
        }
    }
    
    
    
    @IBAction func btnAddressTapped(_ sender: Any) {
        btnAddress.isSelected = true
        btnCategories.isSelected = false
        self.configureButtons()
    }
    

    @IBAction func btnCategoriesTapped(_ sender: Any) {
        btnAddress.isSelected = false
        btnCategories.isSelected = true
        self.configureButtons()
    }
}
