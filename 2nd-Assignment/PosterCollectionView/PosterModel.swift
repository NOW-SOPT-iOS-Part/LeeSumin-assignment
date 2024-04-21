//
//  PosterModel.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/21/24.
//

import UIKit

struct PosterModel{
    let posterImg: UIImage
}

extension PosterModel{
    static func posterDummy() -> [PosterModel]{
        return [
            PosterModel(posterImg: .movie5),
            PosterModel(posterImg: .movie4),
            PosterModel(posterImg: .movie3),
            PosterModel(posterImg: .movie2),
            PosterModel(posterImg: .movie1)
        ]
    }
} // 왜 static func?

