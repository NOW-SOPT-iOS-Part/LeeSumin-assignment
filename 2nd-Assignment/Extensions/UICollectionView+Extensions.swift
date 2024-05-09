//
//  UICollectionView+Extensions.swift
//  2nd-Assignment
//
//  Created by 이수민 on 5/9/24.
//

import UIKit

extension UICollectionView{
    static func horizontalFlowLayout() -> UICollectionViewFlowLayout{
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionHeadersPinToVisibleBounds = true
        return flowLayout
    }
}

