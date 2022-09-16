//
//  HomeModel.swift
//  Peachtree
//
//  Created by Anand on 17/09/22.
//

import Foundation
import UIKit

class HomeVCTableItem<T> {
    var iconName: String?
    var title: String?
    var type: T?
    var showArrow: Bool?
    var isSelected: Bool? = false
    
    init(iconName: String?, title: String?, type: T?, showArrow: Bool?) {
        self.iconName = iconName
        self.title = title
        self.type = type
        self.showArrow = showArrow
    }
}

class MoreItem<T> {
    var title: String?
    var type: T?
    var iconName: String?
    
    init(iconName: String?,title: String?, type: T?) {
        self.iconName = iconName
        self.title = title
        self.type = type
    }
}

