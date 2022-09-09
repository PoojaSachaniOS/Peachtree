//
//  LBSatoshiRegular14.swift
//  Peachtree
//
//  Created by Pooja Softradix on 09/09/22.
//


import UIKit

class LBSatoshiRegular14: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.satoshiRegularFontWithSize(size: 14)
        textColor = Colors.color_AppThemeBlack?.withAlphaComponent(0.7)
    }
}

