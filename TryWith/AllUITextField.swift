//
//  AllUITextField.swift
//  TryWith
//
//  Created by APPLE MAC MINI on 04/07/17.
//  Copyright © 2017 APPLE MAC MINI. All rights reserved.
//

import UIKit

class AllUITextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    
    //for giving padding of text.. ok but for this we have a simple step make on image for get it... wil show that later
    // but ets check why this issue is coiming
}
