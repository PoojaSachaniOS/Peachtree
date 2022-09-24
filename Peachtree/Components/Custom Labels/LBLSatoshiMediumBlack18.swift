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
        textColor = Colors.color_AppThemeBlack
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.defaultSatoshiMediumFontWithSize(size: 24)
            return
        }
        font = FontHelper.defaultSatoshiMediumFontWithSize(size: 18)
    }

}
