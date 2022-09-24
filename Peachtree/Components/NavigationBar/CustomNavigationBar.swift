//
//  File.swift
//  Peachtree
//
//  Created by Apple on 19/09/22.
//

import Foundation
import UIKit


class CustomNavigationBar: UINavigationBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let newSize :CGSize = CGSize(width: self.frame.size.width,height: 84)
        return newSize
    }
}
