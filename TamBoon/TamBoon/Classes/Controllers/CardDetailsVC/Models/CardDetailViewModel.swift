//
//  CardDetailViewModel.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class CardDetailViewModel: CardViewModelProtocol {
    
    var identifier: String = ""
    var cardDetail: [CardDetailProtocol] = []
    var networkManager: NetworkManager!
    
    func generateFields() {
        
        networkManager = NetworkManager()
        identifier = CardDetailViewModel.concreteCellIdentifier
        cardDetail = [CardDetailModel(title: "Card Holder Name", txtFld_Entry: "", txtFld_PlaceHolder: "Type here...", txtFld_KeyBoardType: UIKeyboardType.default),
                      CardDetailModel(title: "Account Number", txtFld_Entry: "", txtFld_PlaceHolder: "Type here...", txtFld_KeyBoardType: UIKeyboardType.numberPad),
                      CardDetailModel(title: "Expire Date", txtFld_Entry: "", txtFld_PlaceHolder: "Type here...", txtFld_KeyBoardType: UIKeyboardType.numberPad),
                      CardDetailModel(title: "CVV", txtFld_Entry: "", txtFld_PlaceHolder: "Type here...", txtFld_KeyBoardType: UIKeyboardType.numberPad),
                      CardDetailModel(title: "Amount", txtFld_Entry: "", txtFld_PlaceHolder: "Type here...", txtFld_KeyBoardType: UIKeyboardType.numberPad)]
    }
    
    func payWithCardDetails(_ name: String, amount: Int, callback: @escaping ((Bool) -> ())) {
        
        let param = ["NAME".localize(): name,
                     "TOKEN".localize(): "tokn_test_deadbeef",
                     "AMOUNT".localize(): amount] as HTTPParameters
        networkManager.post(.donations, param: param) { (result: SuccessResponse?, error) in
            
            if let model = result, model.error_message != "" {
                print("================= Error Details ================= \n",model.error_code, model.error_message)
            }
            
            // result would be True/False and True is also decoded here to show a success pop up as per task guidlines
            callback(result?.success ?? true)
        }
    }
    
    func isValid(_ card: [CardDetailProtocol]) -> Bool {
        
        if card[0].txtFld_Entry.isEmpty {
            Util.showAlertWithMessage("Please enter your Full Name.", title: "ALERT".localize())
            return false
        }else if card[1].txtFld_Entry.isEmpty {
            Util.showAlertWithMessage("Please enter your Account Number.", title: "ALERT".localize())
            return false
        }else if card[2].txtFld_Entry.isEmpty {
            Util.showAlertWithMessage("Please enter card Expire Date.", title: "ALERT".localize())
            return false
        }else if card[3].txtFld_Entry.isEmpty {
            Util.showAlertWithMessage("Please enter your card CVV number.", title: "ALERT".localize())
            return false
        }else if card[4].txtFld_Entry.isEmpty {
            Util.showAlertWithMessage("Please enter Amount.", title: "ALERT".localize())
            return false
        }
        
        return true
    }
}

extension CardDetailViewModel {
    
    static let concreteCellIdentifier: String = {
        return "CardCell"
    }()
}
