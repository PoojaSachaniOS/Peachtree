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
        textColor = UIColor.white
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.defaultSatoshiBoldFontWithSize(size: 80)
            return
        }
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 60)
    }
   
}
