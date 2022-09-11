//
//  LBLSatoshiBoldBlack16.swift
//  Peachtree
//
//  Created by Anand on 11/09/22.
//

import UIKit

class LBLSatoshiBoldBlack16: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 16)
        textColor = UIColor.black//Colors.color_DarkBlue
    }

}
