//
//  UILabel+Extensions.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/30/24.
//

import UIKit

extension UILabel{
    private func mutableAttributedString() -> NSMutableAttributedString? {
        guard let labelText = self.text, let labelFont = self.font else { return nil }
        
        var attributedString: NSMutableAttributedString?
        if let attributedText = self.attributedText {
            attributedString = attributedText.mutableCopy() as? NSMutableAttributedString
        } else {
            attributedString = NSMutableAttributedString(string: labelText,
                                                         attributes: [NSAttributedString.Key.font :labelFont])
        }
        
        return attributedString
    } // String -> attributedString
    
    func setUnderline(range: NSRange, thickness: CGFloat) {
        guard let attributedString = self.mutableAttributedString() else { return }
        
        let underlineStyle: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue | NSUnderlineStyle.thick.rawValue
            ]
        attributedString.addAttributes(underlineStyle, range: range)
        
        // Customize the underline thickness
        let underlineThickness: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.baselineOffset: 7
        ]
        attributedString.addAttributes(underlineThickness, range: range)
        
        self.attributedText = attributedString
    }

    
}
