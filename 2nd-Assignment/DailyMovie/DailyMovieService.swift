//
//  DailyMovieService.swift
//  2nd-Assignment
//
//  Created by 이수민 on 5/9/24.
//

import UIKit

import Moya

final class DailyMovieService {
    static let shared = DailyMovieService()
    
    private var movieProvider = MoyaProvider<MovieTargetType>(plugins: [MoyaLoggingPlugin()])

    private init() {}
}

extension DailyMovieService {
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        switch statusCode {
        case 200..<205:
            let decodingResult = self.decodeDailyMovieResponse(from: data)
            return decodingResult
//            return .success(decodingResult)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

    private func decodeDailyMovieResponse(from data: Data) -> NetworkResult<Any> {
        do {
            let decoder = JSONDecoder()
            let dailyMovieResponse = try decoder.decode(DailyMovieResponse.self, from: data)
            return .success(dailyMovieResponse as Any)
        } catch {
            return .decodedErr
        }
    }
    
    func getDailyMovie(key: String, targetDt: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        movieProvider.request(.getDailyMovie(key: key, targetDt: targetDt)) {
            result in
            switch result{
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
        
                let networkResult = self.judgeStatus(by: statusCode, data, DailyMovieResponse.self)
                print("@Log1 - \(networkResult)")
                completion(networkResult)
            case .failure(_):
                completion(.networkFail)
            }
        }
    }
}
