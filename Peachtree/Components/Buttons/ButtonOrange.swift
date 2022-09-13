//
//  ButtonOrange56.swift
//  Peachtree
//
//  Created by Pooja Softradix on 14/09/22.
//

import UIKit

class ButtonOrange: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateView()
    }
    
    func updateView() {
        isEnabled = true
        layer.cornerRadius = 8
        layer.masksToBounds = true
        titleLabel?.font = FontHelper.defaultSatoshiBoldFontWithSize(size: 17)

    }
    
    override var isEnabled: Bool {
        didSet {
            if(self.isEnabled) {
                backgroundColor = Colors.color_AppOrange
                setTitleColor(UIColor.white, for: .normal)
            } else {
                backgroundColor = Colors.color_AppOrange
                setTitleColor(UIColor.white, for: .normal)
            }
        }
    }

}
