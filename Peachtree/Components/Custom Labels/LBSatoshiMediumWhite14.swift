//
//  LBSatoshiMediumBlack14.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class LBSatoshiMediumWhite14: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        textColor = UIColor.white
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.defaultSatoshiMediumFontWithSize(size: 20)
            return
        }
        font = FontHelper.defaultSatoshiMediumFontWithSize(size: 14)
    }

}
