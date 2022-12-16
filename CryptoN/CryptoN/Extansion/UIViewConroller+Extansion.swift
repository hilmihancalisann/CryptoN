//
//  UIViewConroller+Extansion.swift
//  CryptoN
//
//  Created by Hilmihan Çalışan on 11.11.2022.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantitate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
