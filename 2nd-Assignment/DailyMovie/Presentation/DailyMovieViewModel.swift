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
    private let targetDt = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
    }()
    
    var dailyMovieInfo : ObservablePattern<[DailyMovieInfo]> = ObservablePattern([])
    
    init(useCase: DailyMovieUseCase) {
        self.useCase = useCase
        setData(key: key, targetDt: targetDt) //init에서 정의하면 vc에서 따로 안 불러와도 됨..?
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
