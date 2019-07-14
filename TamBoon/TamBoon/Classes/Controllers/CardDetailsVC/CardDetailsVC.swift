//
//  CardDetailsVC.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class CardDetailsVC: UIViewController {

    var cardDetailVM: CardViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardDetailVM.generateFields()
    }
    @IBAction func btnPay_Action(_ sender: Any) {
        let cardDetail = cardDetailVM.cardDetail

        // Validiate all the fields.
        guard cardDetailVM.isValid(cardDetail) else {
            return
        }
        cardDetailVM.payWithCardDetails(cardDetail[0].txtFld_Entry, amount: Int(cardDetail[4].txtFld_Entry)!) { (success) in
            
            DispatchQueue.main.async {
                PopUpView.initialise()
            }
        }
    }
}

extension CardDetailsVC: UITabBarDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardDetailVM.cardDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cardDetailVM.identifier, for: indexPath) as! CardDetailCell
        
        cell.configure(card: cardDetailVM.cardDetail[indexPath.row], index: indexPath.row)
        return cell
    }
}

extension CardDetailsVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        cardDetailVM.cardDetail[textField.tag].txtFld_Entry = textField.text
        
        print(cardDetailVM.cardDetail)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //Format Date of Birth dd-MM-yyyy
        
        //initially identify your textfield
        
        if textField.tag == 2 {
            
            // check the chars length dd -->2 at the same time calculate the dd/MM
            if (textField.text?.count == 2) {
                //Handle backspace being pressed
                if !(string == "") {
                    // append the text
                    textField.text = (textField.text)! + "/"
                }
            }
            // check the condition not exceed 9 chars
            return !(textField.text!.count > 4 && (string.count) > range.length)
        }
        else {
            return true
        }
    }
}
