//
//  Direction.swift
//  CollectionAnimationDemo
//
//  Created by Softradix Mac Mini on 16/08/22.
//
import UIKit

public enum Direction: Int, CaseIterable {

    case top
    case left
    case right
    case bottom
    
    var isVertical: Bool {
        switch self {
        case .top, .bottom:
            return true
        default:
            return false
        }
    }

    var sign: CGFloat {
        switch self {
        case .top, .left:
            return -1
        case .right, .bottom:
            return 1
        }
    }

    static func random() -> Direction {
        return allCases.randomElement()!
    }
}
