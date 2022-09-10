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
        font = FontHelper.defaultSatoshiLightFontWithSize(size: 16)
        textColor = Colors.color_LightGrey
    }


}
