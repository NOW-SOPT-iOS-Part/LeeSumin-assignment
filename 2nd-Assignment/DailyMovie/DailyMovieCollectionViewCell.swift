//
//  DailyMovieCollectionViewCell.swift
//  2nd-Assignment
//
//  Created by 이수민 on 5/10/24.
//

import UIKit

final class DailyMovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DailyMovieCollectionViewCell"

    var dailyMovieRow: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemCyan
        self.layer.cornerRadius = 10
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [rankingLabel, nameLabel, openDateLabel, audienceLabel].forEach {
            contentView.addSubview($0)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(9)
            $0.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(rankingLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(9)
            $0.height.equalTo(30)
        }
        
        openDateLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(9)
            $0.height.equalTo(30)
        }
        
        audienceLabel.snp.makeConstraints{
            $0.top.equalTo(openDateLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(9)
            $0.height.equalTo(30)
        }
    }
    
    private let rankingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Regular", size: 36)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    
    private let openDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    
    private let audienceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
}

extension DailyMovieCollectionViewCell {
    func dataBind(_ dailyMovieData: DailyMovieInfo, dailyMovieRow: Int) {
        rankingLabel.text = dailyMovieData.rank
        nameLabel.text = dailyMovieData.name
        openDateLabel.text = dailyMovieData.openDate
        audienceLabel.text = dailyMovieData.audience
        self.dailyMovieRow = dailyMovieRow
    }
}
