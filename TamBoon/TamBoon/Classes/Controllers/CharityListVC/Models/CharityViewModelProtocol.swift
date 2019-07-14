//
//  CharityViewModelProtocol.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol CharityViewModelProtocol {
    var identifier: String { get }
    var dataModel: [CharityModelProtocol] {get set}
    
    func getAllCharities(callback: @escaping ((Bool) -> ()))
}

