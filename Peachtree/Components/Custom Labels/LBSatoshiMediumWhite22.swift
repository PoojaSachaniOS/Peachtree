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
        
        textColor = UIColor.white
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.satoshiRegularFontWithSize(size: 28)
            return
        }
        font = FontHelper.satoshiRegularFontWithSize(size: 22)
    }
}
