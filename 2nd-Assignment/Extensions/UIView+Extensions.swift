//
//  UIView+Extensions.swift
//  2nd-Assignment
//
//  Created by 이수민 on 5/9/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false

        }
    }
}
