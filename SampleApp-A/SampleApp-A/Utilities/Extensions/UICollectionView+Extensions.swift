//
//  UITableView+Extensions.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import Foundation
import UIKit

extension UICollectionView {
    
    // MARK: - Cells
    
    func register(viewClass: UICollectionViewCell.Type) {
        self.register(viewClass, forCellWithReuseIdentifier: viewClass.identifier)
    }
    
    func register(nib: UICollectionViewCell.Type) {
        self.register(nib.nib, forCellWithReuseIdentifier: nib.identifier)
    }
    
    func register(viewClass: [UICollectionViewCell.Type]) {
        viewClass.forEach { (cell) in
            self.register(viewClass: cell)
        }
    }
    
    func register(nib: [UICollectionViewCell.Type]) {
        nib.forEach { (cell) in
            self.register(nib: cell)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
    
    func cellForItem<T: UICollectionViewCell>(at indexPath: IndexPath) -> T {
        return cellForItem(at: indexPath) as! T
    }
    
    // MARK: - Reusable Views
    
    func register(viewClass: UICollectionReusableView.Type, ofKind kind: String) {
        self.register(viewClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: viewClass.identifier)
    }
    
    func register(nib: UICollectionReusableView.Type, ofKind kind: String) {
        self.register(nib.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: nib.identifier)
    }
    
    func register(viewClass: [UICollectionReusableView.Type], ofKind kind: String) {
        viewClass.forEach { (cell) in
            self.register(viewClass: cell, ofKind: kind)
        }
    }
    
    func register(nib: [UICollectionReusableView.Type], ofKind kind: String) {
        nib.forEach { (cell) in
            self.register(nib: cell, ofKind: kind)
        }
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(ofKind kind: String, for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}

extension UICollectionViewDelegateFlowLayout {
    func centerItemsInCollectionView(cellWidth: Double, numberOfItems: Int, spaceBetweenCell: Double, collectionView: UICollectionView) -> UIEdgeInsets {
        let totalWidth = cellWidth * Double(numberOfItems)
        let totalSpacingWidth = spaceBetweenCell * (Double(numberOfItems) - 1)
        let leftInset = (collectionView.frame.width - CGFloat(totalWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}

extension UICollectionReusableView {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    var identifier: String {
        return String(describing: self)
    }
}

