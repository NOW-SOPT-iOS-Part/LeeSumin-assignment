//
//  DailyMovieUseCase.swift
//  2nd-Assignment
//
//  Created by 이수민 on 6/7/24.
//

class DailyMovieUseCase {
    private let repository: DailyMovieRepository
    
    init(repository: DailyMovieRepository) {
        self.repository = repository
    }
    
    func getDailyMovie(key: String, targetDt: String, completion: @escaping (NetworkResult<DailyMovieDto>) -> Void) {
        repository.getDailyMovie(key: key, targetDt: targetDt, completion: completion)
    }

}
