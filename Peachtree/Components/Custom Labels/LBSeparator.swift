//
//  LBSeparator.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class LBSeparator: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        backgroundColor = Colors.colorSeparator
    }

}
