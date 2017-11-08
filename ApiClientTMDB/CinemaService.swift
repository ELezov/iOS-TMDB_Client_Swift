//
//  WeatherService.swift
//  iOS-OpenWeatherMapClientRx
//
//  Created by Nikolay on 07.11.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import Foundation
import Alamofire

enum CinemaService {
    case getCinemaList(query: String)
}

extension CinemaService: Endpoint {
    
    var parameters: Parameters {
        switch self {
        case  .getCinemaList(let query):
                return ["api_key": API_KEY,
                        "page": 1,
                        "query": query,
                        "language": "ru"]
        }
    }

    
    var headers: HTTPHeaders {
        return ["Authorization": ""]
    }

    
    var method: HTTPMethod {
        switch self {
        case .getCinemaList:
            return .get
        }
    }

    var path: String {
        switch  self {
            case .getCinemaList: return PATH_SEARCH_MOVIE
        }
    }

    
    var baseURL: String {
        return BASE_URL
    }

    
}
