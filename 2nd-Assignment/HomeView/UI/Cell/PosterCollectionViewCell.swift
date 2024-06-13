//
//  PosterCollectionViewCell.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/21/24.
//

import UIKit
import SnapKit

final class PosterCollectionViewCell: UICollectionViewCell { //cell은 항상 다 final class?
    static let identifier = "PosterCollectionViewCell" //식별자 까먹지 말자
    var posterRow: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        posterImageView.snp.makeConstraints{
           $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    override func prepareForReuse() {
        super.prepareForReuse()
    }
     //굳이 필요 X ??
     */
    
    private let posterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill //이미지를 비율에 맞게
        return imageView
    }()
    
}

extension PosterCollectionViewCell{
    func dataBind(_ posterData: PosterModel, _ posterRow: Int){
        posterImageView.image = posterData.posterImg
        self.posterRow = posterRow
    }
}
