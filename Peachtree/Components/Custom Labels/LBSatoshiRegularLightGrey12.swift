//
//  LBSatoshiRegular12.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class LBSatoshiRegularLightGrey12: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        textColor = Colors.color_LightGrey
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.satoshiRegularFontWithSize(size: 18)
            return
        }
        font = FontHelper.satoshiRegularFontWithSize(size: 12)
    }
}

