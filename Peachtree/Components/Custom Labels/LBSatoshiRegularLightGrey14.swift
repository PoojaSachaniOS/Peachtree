//
//  LBSatoshiRegular14.swift
//  Peachtree
//
//  Created by Pooja Softradix on 09/09/22.
//


import UIKit

class LBSatoshiRegularLightGrey14: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.defaultSatoshiRegularFontWithSize(size: 14)
        textColor = Colors.color_LightGrey
    }
}

