//
//  LBLSatoshiBoldBlack24.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class LBLSatoshiBoldBlack24: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        textColor = Colors.color_DarkBlue
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.defaultSatoshiBoldFontWithSize(size: 30)
            return
        }
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 24)
    }

}
