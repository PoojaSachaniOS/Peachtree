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
        textColor = Colors.color_LightGrey
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.satoshiBoldFontWithSize(size: 20)
            return
        }
        font = FontHelper.satoshiBoldFontWithSize(size: 14)
    }
}
