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
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 24)
        textColor = Colors.color_DarkBlue
    }

}
