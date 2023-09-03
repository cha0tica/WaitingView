//
//  RefusalViewModel.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 28.08.2023.
//

import Foundation
import UIKit

class RefusalViewController : UIViewController {
    
    @IBOutlet weak var changeDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 1, green: 0.61, blue: 0.29, alpha: 1).cgColor,
            UIColor(red: 0.96, green: 0.47, blue: 0.08, alpha: 1).cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = changeDataButton.bounds
        
        changeDataButton.layer.insertSublayer(gradientLayer, at: 0)
        changeDataButton.setTitleColor(UIColor.white, for: .normal)
        changeDataButton.layer.cornerRadius = changeDataButton.bounds.height / 2
        changeDataButton.clipsToBounds = true
    }
}
