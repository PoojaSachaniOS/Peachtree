//
//  LBSatoshiBoldBlack14.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class LBSatoshiBoldLightGrey14: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.satoshiBoldFontWithSize(size: 14)
        textColor = Colors.color_LightGrey
    }
}
