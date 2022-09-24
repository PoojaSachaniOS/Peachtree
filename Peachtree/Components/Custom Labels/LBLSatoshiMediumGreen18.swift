//
//  LBLSatoshiMediumGreen18.swift
//  Peachtree
//
//  Created by Pooja Softradix on 12/09/22.
//

import UIKit

class LBLSatoshiMediumGreen18: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        textColor = Colors.color_Green
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.defaultSatoshiMediumFontWithSize(size: 24)
            return
        }
        font = FontHelper.defaultSatoshiMediumFontWithSize(size: 18)
    }

}
