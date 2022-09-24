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
        textColor = UIColor.black
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.satoshiMediumFontWithSize(size: 23)
            return
        }
        font = FontHelper.satoshiMediumFontWithSize(size: 17)
    }
    
}
