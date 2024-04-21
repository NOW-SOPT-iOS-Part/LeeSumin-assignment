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
        seriesImageView.snp.makeConstraints{
           $0.top.leading.bottom.trailing.equalToSuperview()
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
        return imageView
    }()
    
}

extension SeriesCollectionViewCell{
    func dataBind(_ seriesData: PosterModel, _ seriesRow: Int){
        seriesImageView.image = seriesData.posterImg
        self.seriesRow = seriesRow
    }
}
