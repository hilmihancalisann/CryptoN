//
//  Extansion+UIView.swift
//  CryptoN
//
//  Created by Hilmihan Çalışan on 10.11.2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get {return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
