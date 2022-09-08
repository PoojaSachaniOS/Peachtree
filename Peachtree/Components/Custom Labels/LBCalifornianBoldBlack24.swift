//
//  LBCalifornianBoldWhite24.swift
//  Peachtree
//
//  Created by Pooja Softradix on 08/09/22.
//

import UIKit

class LBCalifornianBoldBlack24: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.californianBoldFontWithSize(size: 24)
        textColor = UIColor.black
    }
}
