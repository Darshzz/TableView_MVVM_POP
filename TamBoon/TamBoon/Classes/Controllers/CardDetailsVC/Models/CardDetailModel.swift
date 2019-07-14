//
//  CardDetailModel.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class CardDetailModel: CardDetailProtocol {
    
    var title: String!
    var txtFld_Entry: String!
    var txtFld_PlaceHolder: String!
    var txtFld_KeyBoardType: UIKeyboardType!
    
    init(title: String, txtFld_Entry: String, txtFld_PlaceHolder: String, txtFld_KeyBoardType: UIKeyboardType) {
        self.title = title
        self.txtFld_Entry = txtFld_Entry
        self.txtFld_PlaceHolder = txtFld_PlaceHolder
        self.txtFld_KeyBoardType = txtFld_KeyBoardType
    }
}
