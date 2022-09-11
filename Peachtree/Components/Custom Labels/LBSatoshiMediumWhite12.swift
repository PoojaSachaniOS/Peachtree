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
        font = FontHelper.satoshiMediumFontWithSize(size: 12)
        textColor = UIColor.white
    }
}

