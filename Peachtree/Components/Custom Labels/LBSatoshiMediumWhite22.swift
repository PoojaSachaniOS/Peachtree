//
//  LBSatoshiMediumWhite22.swift
//  Peachtree
//
//  Created by Pooja Softradix on 08/09/22.
//

import UIKit

class LBSatoshiMediumWhite22: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.satoshiRegularFontWithSize(size: 22)
        textColor = UIColor.white
    }
}
