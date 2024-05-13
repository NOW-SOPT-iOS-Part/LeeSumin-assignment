//
//  MovieTargetType.swift
//  2nd-Assignment
//
//  Created by 이수민 on 5/9/24.
//

import Foundation

import Moya

enum MovieTargetType {
    case getDailyMovie(key: String, targetDt: String)
}

extension MovieTargetType : TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self{
        case .getDailyMovie:
            return "/searchDailyBoxOfficeList.json"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getDailyMovie:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .getDailyMovie(let key, let targetDt):
            return .requestParameters(parameters: ["key" : key,
                                                   "targetDt" : targetDt],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case .getDailyMovie:
                return ["Content-Type": "application/json"
            ]
        }
    }
}
