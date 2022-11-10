//
//  OnboardinCollectionViewCell.swift
//  CryptoN
//
//  Created by Hilmihan Çalışan on 10.11.2022.
//

import UIKit

class OnboardinCollectionViewCell: UICollectionViewCell {
    
    static let idenfier = String(describing: OnboardinCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    
    func setup (_ slide: OnboardinSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
        
    }
    
}
