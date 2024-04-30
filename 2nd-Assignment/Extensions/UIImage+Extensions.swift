//
//  UIImage+Extensions.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/21/24.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
