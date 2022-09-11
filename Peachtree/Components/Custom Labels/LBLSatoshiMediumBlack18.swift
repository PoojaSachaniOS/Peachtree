//
//  LBLSatoshiMediumBlack18.swift
//  Peachtree
//
//  Created by Anand on 11/09/22.
//

import UIKit

class LBLSatoshiMediumBlack18: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.defaultSatoshiMediumFontWithSize(size: 18)
        textColor = Colors.color_AppThemeBlack
    }

}
