//
//  LBSatoshiBlack60.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

class LBSatoshiWhite60: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 60)
        textColor = UIColor.white
    }
   
}
