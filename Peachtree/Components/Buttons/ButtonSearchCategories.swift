//
//  ButtonLightGreenRegular14.swift
//  Permaxo
//
//  Created by Pooja Softradix on 03/02/22.
//

import UIKit

class ButtonSearchCategories: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateView()
    }
    
    func updateView() {
        isEnabled = false
        let size = 16.0
        
        titleLabel?.font = FontHelper.defaultSatoshiBoldFontWithSize(size: 16)
        setTitleColor(Colors.color_AppThemeBlack, for: .selected)
        layer.cornerRadius = 4
        layer.masksToBounds = true
    }
    
    /*
    override var isEnabled: Bool {
        didSet {
            if(self.isEnabled) {
                layer.borderColor = Colors.color_AppOrange?.cgColor
                layer.borderWidth = 1
                backgroundColor = Colors.color_AppOrange
            } else {
                layer.borderColor = Colors.color_AppThemeBlack?.cgColor
                layer.borderWidth = 1
                backgroundColor = UIColor.white
            }
        }
    }*/

}

