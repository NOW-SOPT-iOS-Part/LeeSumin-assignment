//
//  SeriesCollectionHeaderView.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/21/24.
//

import UIKit

class SeriesCollectionHeaderView: UICollectionReusableView { //UICollectionReusableView는 뭘까?

    static let identifier = "SeriesCollectionHeaderView"
    
    func configure(withTitle title: String) {
        titleLabel.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        showAllButtonConfiguration()
        addSubviews(titleLabel, showAllButton)
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(15)
            $0.top.bottom.centerY.equalToSuperview()
        }
        showAllButton.snp.makeConstraints{
            $0.top.bottom.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(5)
        }
    }
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        label.textColor = .white
        return label
    }()
    
    // button configuration 공부하기
    var container = AttributeContainer()
    var configuration = UIButton.Configuration.plain()
    
    private func showAllButtonConfiguration(){
        container.font = UIFont(name: "Pretendard-Medium", size: 11)
        container.foregroundColor = UIColor(named: "gray2.5") //textcolor
        configuration.attributedTitle = AttributedString("전체보기", attributes: container)
        configuration.image = UIImage(named: "chevronRight")?.resized(to: CGSize(width: 10, height: 10))
        configuration.imagePlacement = .trailing
    }
    
    private lazy var showAllButton: UIButton = {
        var button = UIButton(configuration: configuration)
        return button
    }()

}
