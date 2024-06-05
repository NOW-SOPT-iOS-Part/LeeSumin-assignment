//
//  ChannelCollectionViewCell.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/28/24.
//

import UIKit

import SnapKit

final class ChannelCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChannelCollectionViewCell"
    var channelRow: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [channelImageView, channelRanking, channelStation, channelTitle, channelRating].forEach{
            contentView.addSubview($0)
        }
        channelImageView.snp.makeConstraints{
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(80)
        }
        channelRanking.snp.makeConstraints{
            $0.top.equalToSuperview().offset(88)
            $0.leading.equalToSuperview().offset(12.88)
            $0.width.equalTo(9)
        }
        channelStation.snp.makeConstraints{
            $0.top.equalToSuperview().offset(91)
            $0.leading.equalToSuperview().offset(24)
        }
        channelTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(106)
            $0.leading.equalTo(channelStation.snp.leading)
        }
        channelRating.snp.makeConstraints{
            $0.top.equalToSuperview().offset(122)
            $0.leading.equalTo(channelStation.snp.leading)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private let channelImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 3
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let channelRanking: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 19)
        label.textColor = UIColor(.white)
        return label
    }()
    
    private let channelStation: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 10)
        label.textColor = UIColor(.white)
        return label
    }()
    
    private let channelTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 10)
        label.textColor = UIColor(.gray2)
        return label
    }()
    
    private let channelRating: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 10)
        label.textColor = UIColor(.gray2)
        return label
    }()
    
}

extension ChannelCollectionViewCell{
    func dataBind(_ channelData: ChannelModel, _ channelRow: Int){
        channelImageView.image = channelData.channelImg
        channelRanking.text = channelData.channelRanking
        channelStation.text = channelData.channelStation
        channelTitle.text = channelData.channelTitle
        channelRating.text = channelData.channelRating
        self.channelRow = channelRow
    }
}
