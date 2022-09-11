//
//  UICollectionView + ViewAnimator.swift
//  CollectionAnimationDemo
//
//  Created by Softradix Mac Mini on 16/08/22.
//
import Foundation
import UIKit

public extension UICollectionView {

    var orderedVisibleCells: [UICollectionViewCell] {
        return indexPathsForVisibleItems.sorted().compactMap { cellForItem(at: $0) }
    }

    func visibleCells(in section: Int) -> [UICollectionViewCell] {
        return visibleCells.filter { indexPath(for: $0)?.section == section }
    }
}
