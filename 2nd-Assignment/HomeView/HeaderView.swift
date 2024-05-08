//
//  HeaderView.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/21/24.
//

import UIKit

class HeaderView: UIStackView {
    override init(frame: CGRect) {
        super .init(frame: frame)
        for element in headerLabelElement{
            self.addArrangedSubview(makeHeaderLabel(element))
        }
        self.distribution = .equalSpacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeHeaderLabel(_ element: String) -> UILabel{
        let label = UILabel()
        label.text = element
        label.font = UIFont(name: "Pretendard-Regular", size: 17)
        label.textColor = .white
        label.setUnderline(range: NSRange(location: 0, length: label.text?.count ?? 0), thickness: 3.0)
        return label
    }
    
    let headerLabelElement = ["홈", "시리즈", "TV프로그램", "영화", "파라마운트+"]

}
