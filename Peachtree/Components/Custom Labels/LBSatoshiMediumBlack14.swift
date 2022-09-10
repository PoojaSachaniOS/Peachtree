//
//  LBSatoshiMediumBlack14.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class LBSatoshiMediumBlack14: UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.defaultSatoshiMediumFontWithSize(size: 14)
        textColor = UIColor.black
    }
}
