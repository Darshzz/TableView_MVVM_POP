//
//  Util.swift
//  TamBoon
//
//  Created by Darshan on 13/07/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class Util {
    
    class func showAlertWithMessage(_ message: String, title: String)
    {
        //** If any Alert view is alrady presented then do not show another alert
        var viewController : UIViewController!
        if let vc  = UIApplication.topMostWindowController() {
            if (vc.isKind(of: UIAlertController.self)) {
                return
            }else{
                viewController = vc
            }
        }else{
            viewController = appDelegate.window?.rootViewController!
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        viewController!.present(alert, animated: true, completion: nil)
    }
}
