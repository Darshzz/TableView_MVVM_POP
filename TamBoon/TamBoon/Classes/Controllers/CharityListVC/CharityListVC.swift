//
//  CharityListVC.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class CharityListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var charityVM: CharityViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        charityVM.getAllCharities { [weak self] (suceess) in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}


extension CharityListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charityVM.dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: charityVM.identifier, for: indexPath) as! CharityCell
        
        cell.configure(charity: charityVM.dataModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cardVC = CardDetailsVC.instance() as! CardDetailsVC
        cardVC.cardDetailVM = CardDetailViewModel()
        navigationController?.pushViewController(cardVC, animated: true)
    }
}
