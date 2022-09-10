//
//  LBSatoshiRegular12.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class LBSatoshiRegular12: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.satoshiRegularFontWithSize(size: 12)
        textColor = Colors.color_AppThemeBlack
    }
}
