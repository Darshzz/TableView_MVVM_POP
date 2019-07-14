//
//  CardDetailViewModelProtocol.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation

protocol CardViewModelProtocol {
    
    var identifier: String { get }
    var cardDetail: [CardDetailProtocol] {get set}
    func generateFields()
    func isValid(_ card: [CardDetailProtocol]) -> Bool
    func payWithCardDetails(_ name: String, amount: Int, callback: @escaping ((Bool) -> ()))
}
