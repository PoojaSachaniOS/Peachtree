//
//  LBSatoshiRegularBlack14.swift
//  Peachtree
//
//  Created by Anand on 11/09/22.
//

import UIKit

class LBSatoshiMediumBlack17: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.satoshiMediumFontWithSize(size: 17)
        textColor = UIColor.black
    }
    
}
