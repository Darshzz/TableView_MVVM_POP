//
//  CardDetailProtocol.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

protocol CardDetailProtocol {
    
    var title: String! { get set }
    var txtFld_Entry: String! { get set }
    var txtFld_PlaceHolder: String! { get set }
    var txtFld_KeyBoardType: UIKeyboardType! { get set }
}
