//
//  CharityCell.swift
//  TamBoon
//
//  Created by Darshan on 12/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit
import Kingfisher

class CharityCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(charity: CharityModelProtocol) {
        
        lblName.text = charity.name
        let url = URL(string: charity.logo_url)!
        self.imgView.kf.setImage(with: url)
    }

}
