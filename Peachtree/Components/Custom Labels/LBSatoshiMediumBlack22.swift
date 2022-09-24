//
//  LBSatoshiMediumBlack22.swift
//  Peachtree
//
//  Created by Pooja Softradix on 09/09/22.
//

import UIKit

class LBSatoshiMediumBlack22: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        textColor = UIColor.black
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.satoshiRegularFontWithSize(size: 28)
            return
        }
        font = FontHelper.satoshiRegularFontWithSize(size: 22)
    }
}




