//
//  BannerModel.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/28/24.
//

import UIKit

struct BannerModel{
    let bannerImg : UIImage
    
}

extension BannerModel{
    static let bannerDummy = [
        BannerModel(bannerImg: .doosanWhite),
        BannerModel(bannerImg: .doosanBlack),
        BannerModel(bannerImg: .doosanWhite),
        BannerModel(bannerImg: .doosanBlack)
    ]
}
