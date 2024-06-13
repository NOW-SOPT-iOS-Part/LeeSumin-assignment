//
//  HomeViewModel.swift
//  2nd-Assignment
//
//  Created by 이수민 on 6/5/24.
//

import Foundation


import Foundation

class HomeViewModel: Identifiable {
    let posterDummy = [
        PosterModel(posterImg: .movie5, posterLabel: "너의 이름은"),
        PosterModel(posterImg: .movie4, posterLabel: "스즈메의 문단속"),
        PosterModel(posterImg: .movie3, posterLabel: "반지의 제왕"),
        PosterModel(posterImg: .movie2, posterLabel: "해리포터와 마법사의 돌"),
        PosterModel(posterImg: .movie1, posterLabel: "시그널")
    ]
    
    let bannerDummy = [
        BannerModel(bannerImg: .doosanWhite),
        BannerModel(bannerImg: .doosanBlack),
        BannerModel(bannerImg: .doosanWhite),
        BannerModel(bannerImg: .doosanBlack)
    ]
    
    let channelDummy = [
        ChannelModel(channelImg: .channel1, channelRanking: "1", channelStation: "Mnet", channelTitle: "보이즈 플래닛 12화", channelRating: "80.0%" ),
        ChannelModel(channelImg: .channel2, channelRanking: "2", channelStation: "Mnet", channelTitle: "하트시그널 4화", channelRating: "16.1%" ),
        ChannelModel(channelImg: .channel1, channelRanking: "3", channelStation: "Mnet", channelTitle: "엠카운트다운 568화", channelRating: "3.9%" )
    ]
    

    
}

