//
//  DailyMovieViewModel.swift
//  2nd-Assignment
//
//  Created by 이수민 on 6/7/24.
//

import UIKit

class DailyMovieViewModel {
    private let useCase : DailyMovieUseCase
    private let key = "95dd7589a2ca8b8126c77eabf642771a"
    private let targetDt = "20240510" // Date.movieDate()
    var dailyMovieInfo : ObservablePattern<[DailyMovieInfo]> = ObservablePattern([])
    
    init(useCase: DailyMovieUseCase) {
        self.useCase = useCase
        setData(key: key, targetDt: targetDt)
    }
    
    func setData(key: String, targetDt: String) {
        useCase.getDailyMovie(key: key, targetDt: targetDt) { [weak self] response in
            switch response{
            case .success(let data):
                let dailyMovieData = data.boxOfficeResult.dailyBoxOfficeList.map {
                    DailyMovieInfo(rank: $0.rank, name: $0.movieNm, openDate: $0.openDt, audience: $0.audiAcc)
                }
                self?.dailyMovieInfo.value = dailyMovieData
                print("@Log - \(dailyMovieData)")
            case .decodedErr:
                print("decoding error")
            case .networkFail:
                print("network fail")
            case .pathErr:
                print("path error")
            case .requestErr:
                print("request error")
            case .serverErr:
                print("server error")
            }
        }
    }
}
