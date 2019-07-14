//
//  PopUpView.swift
//  TamBoon
//
//  Created by Darshan on 13/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class PopUpView: UIView {

    @IBOutlet weak var containerView: UIView!
    
    class func initialise() {
        let popUpView = UINib(nibName: "PopUpView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PopUpView
        popUpView.frame = UIScreen.main.bounds
        UIApplication.currentViewController()?.view.addSubview(popUpView)
        
        popUpView.show()
    }
    
    // MARK: Private
    private func show(){
        
        self.containerView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.curveEaseOut], animations: {
            
            self.containerView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    @IBAction func btnClose_Action(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }, completion: { (isFinished : Bool) in
            self.removeFromSuperview()
        UIApplication.currentViewController()?.navigationController?.popViewController(animated: true)
        })
    }
    
}
