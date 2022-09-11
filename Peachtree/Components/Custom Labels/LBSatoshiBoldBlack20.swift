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
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 20)
        //FontHelper.satoshiBoldFontWithSize(size: 20)
        textColor = UIColor.black
    }
}
