//
//  ChannelModel.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/28/24.
//

import UIKit

struct ChannelModel{
    let channelImg : UIImage
    let channelRanking : String
    let channelStation : String
    let channelTitle : String
    let channelRating : String
}

extension ChannelModel{
    static let channelDummy = [
        ChannelModel(channelImg: .channel1, channelRanking: "1", channelStation: "Mnet", channelTitle: "보이즈 플래닛 12화", channelRating: "80.0%" ),
        ChannelModel(channelImg: .channel2, channelRanking: "2", channelStation: "Mnet", channelTitle: "하트시그널 4화", channelRating: "16.1%" ),
        ChannelModel(channelImg: .channel1, channelRanking: "3", channelStation: "Mnet", channelTitle: "엠카운트다운 568화", channelRating: "3.9%" )
        
    ]
}
