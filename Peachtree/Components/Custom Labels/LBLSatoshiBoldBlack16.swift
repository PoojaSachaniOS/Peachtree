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
        textColor = UIColor.black//Colors.color_DarkBlue
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.defaultSatoshiBoldFontWithSize(size: 22)
            return
        }
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 16)
    }

}
