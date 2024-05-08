//
//  SeriesCollectionViewCell.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/21/24.
//

import UIKit
import SnapKit

final class SeriesCollectionViewCell: UICollectionViewCell {
    static let identifier = "SeriesCollectionViewCell"
    var seriesRow: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(seriesImageView)
        contentView.addSubview(seriesLabel)
        seriesImageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(146)
        }
        seriesLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(149)
            $0.leading.bottom.equalToSuperview()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private let seriesImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 3
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let seriesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Medium", size: 10)
        label.textColor = UIColor(.gray2)
        return label
    }()
    
}

extension SeriesCollectionViewCell{
    func dataBind(_ seriesData: PosterModel, _ seriesRow: Int){
        seriesImageView.image = seriesData.posterImg
        seriesLabel.text = seriesData.posterLabel
        self.seriesRow = seriesRow
    }
}
