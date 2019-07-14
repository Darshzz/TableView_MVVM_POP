//
//  CharityModel.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

struct CharityApiResponse: Decodable {
    
    let charities: [CharityModel]
    
    private enum ResponseCodingKeys: CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseCodingKeys.self)
        charities = try container.decode([CharityModel].self, forKey: .data)
    }
}



struct CharityModel: Decodable, CharityModelProtocol {
    
    var id: Int
    var name: String
    var logo_url: String
}
