//
//  PosterModel.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/21/24.
//

import UIKit

struct PosterModel{
    let posterImg: UIImage
    let posterLabel: String
}

extension PosterModel{
    static let posterDummy = [
        PosterModel(posterImg: .movie5, posterLabel: "너의 이름은"),
        PosterModel(posterImg: .movie4, posterLabel: "스즈메의 문단속"),
        PosterModel(posterImg: .movie3, posterLabel: "반지의 제왕"),
        PosterModel(posterImg: .movie2, posterLabel: "해리포터와 마법사의 돌"),
        PosterModel(posterImg: .movie1, posterLabel: "시그널")
    ]
    
} 

