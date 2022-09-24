//
//  LBLSatoshiBoldBlack18.swift
//  Peachtree
//
//  Created by Anand on 11/09/22.
//

import Foundation
import UIKit

class LBLSatoshiBoldBlack18: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        textColor = Colors.color_AppThemeBlack
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.defaultSatoshiBoldFontWithSize(size: 24)
            return
        }
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 18)
    }
}
