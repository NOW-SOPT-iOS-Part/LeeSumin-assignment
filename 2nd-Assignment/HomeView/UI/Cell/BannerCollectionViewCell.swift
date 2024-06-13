//
//  BannerCollectionViewCell.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/28/24.
//

import UIKit

import SnapKit

final class BannerCollectionViewCell: UICollectionViewCell {
    static let identifier = "BannerCollectionViewCell"
    var bannerRow: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bannerImageView)
        bannerImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private let bannerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
}

extension BannerCollectionViewCell{
    func dataBind(_ bannerData: BannerModel, _ bannerRow: Int){
        bannerImageView.image = bannerData.bannerImg
        self.bannerRow = bannerRow
    }
}
