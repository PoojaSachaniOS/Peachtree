//
//  LBSatoshiBoldBlack20.swift
//  Peachtree
//
//  Created by Pooja Softradix on 09/09/22.
//

import UIKit

class LBSatoshiBoldBlack20: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        
        //FontHelper.satoshiBoldFontWithSize(size: 20)
        textColor = UIColor.black
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.defaultSatoshiBoldFontWithSize(size: 26)
            return
        }
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 20)
    }
}
