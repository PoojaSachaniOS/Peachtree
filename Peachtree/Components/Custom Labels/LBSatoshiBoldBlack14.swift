//
//  LBSatoshiBoldBlack14.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class LBSatoshiBoldBlack14: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.satoshiBoldFontWithSize(size: 14)
        textColor = Colors.color_AppThemeBlack?.withAlphaComponent(0.7)
    }
}
