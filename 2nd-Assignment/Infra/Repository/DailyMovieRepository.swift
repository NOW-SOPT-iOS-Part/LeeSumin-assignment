//
//  DailyMovieRepository.swift
//  2nd-Assignment
//
//  Created by 이수민 on 6/7/24.
//

protocol DailyMovieRepositoryProtocol {
    func getDailyMovie(key: String, targetDt: String, completion: @escaping (NetworkResult<DailyMovieDto>) -> Void)
}

class DailyMovieRepository: DailyMovieRepositoryProtocol {
    private let service: DailyMovieService
    init(service: DailyMovieService) {
        self.service = service
    }
    func getDailyMovie(key: String, targetDt: String, completion: @escaping (NetworkResult<DailyMovieDto>) -> Void) {
        service.getDailyMovie(key: key, targetDt: targetDt, completion: completion)
    }
}

