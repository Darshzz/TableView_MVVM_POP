//
//  EndPoint.swift
//  TamBoon
//
//  Created by Darshan on 07/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case staging
}

public enum EndPoint {
    case charities
    case donations
}

extension EndPoint: EndPointType {
   
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .staging: return "https://virtserver.swaggerhub.com/chakritw/tamboon-api/1.0.0/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .charities:
            return "charities"
        case .donations:
            return "donations"
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .charities:
            return .request
        case .donations:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


