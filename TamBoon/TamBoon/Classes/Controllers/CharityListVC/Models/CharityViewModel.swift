//
//  CharityViewModel.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import Foundation


class CharityViewModel: CharityViewModelProtocol {
    
    var identifier: String
    var dataModel: [CharityModelProtocol]
    var networkManager: NetworkManager!
    
    init() {
        networkManager = NetworkManager()
        dataModel = []
        identifier = CharityViewModel.concreteCellIdentifier
    }
    
    func getAllCharities(callback: @escaping ((Bool) -> ())) {
        
        networkManager.get(.charities) { [weak self] (result: CharityApiResponse?, error) in
            guard let model = result, error != "" else {
                print(error ?? "Unble to parse")
                return
            }
            print(model)
            self?.dataModel = model.charities
            callback(true)
        }
    }
}

extension CharityViewModel {
    
    static let concreteCellIdentifier: String = {
        return "CharityCell"
    }()
}
