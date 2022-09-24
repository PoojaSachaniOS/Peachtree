//
//  LBLSatoshiBoldBlack18.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class LBLSatoshiBoldBlack20: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        textColor = Colors.color_DarkBlue
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.defaultSatoshiBoldFontWithSize(size: 26)
            return
        }
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 20)
    }

}
