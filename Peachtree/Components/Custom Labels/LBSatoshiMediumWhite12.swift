//
//  LBSatoshiMediumWhite12.swift
//  Peachtree
//
//  Created by Pooja Softradix on 11/09/22.
//

import UIKit

class LBSatoshiMediumWhite12: UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        textColor = UIColor.white
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.satoshiMediumFontWithSize(size: 18)
            return
        }
        font = FontHelper.satoshiMediumFontWithSize(size: 12)
    }
}

