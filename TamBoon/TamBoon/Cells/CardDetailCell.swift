//
//  CardDetailCell.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class CardDetailCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(card: CardDetailProtocol, index: Int) {
        lblTitle.text = card.title
        txtField.text = card.txtFld_Entry
        txtField.placeholder = card.txtFld_PlaceHolder
        txtField.keyboardType = card.txtFld_KeyBoardType
        txtField.tag = index
    }
}
