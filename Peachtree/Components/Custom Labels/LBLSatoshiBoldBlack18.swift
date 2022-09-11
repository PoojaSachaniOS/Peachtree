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
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 18)
        textColor = Colors.color_AppThemeBlack
    }
}
