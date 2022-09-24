//
//  LBSatoshiLight16.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class LBSatoshiLight16: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        textColor = Colors.color_LightGrey
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.defaultSatoshiLightFontWithSize(size: 22)
            return
        }
        font = FontHelper.defaultSatoshiLightFontWithSize(size: 16)
    }
}
