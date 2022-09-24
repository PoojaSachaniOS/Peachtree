//
//  LBSatoshiMediumBlack20.swift
//  Peachtree
//
//  Created by Pooja Softradix on 08/09/22.
//

import UIKit

class LBSatoshiBoldBlack18: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        
        textColor = UIColor.black
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.californianBoldFontWithSize(size: 24)
            return
        }
        font = FontHelper.californianBoldFontWithSize(size: 18)
    }
}
