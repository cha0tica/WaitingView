//
//  DashedBorder.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 03.09.2023.
//

import Foundation
import UIKit

class DottedBorderButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let borderLayer = CAShapeLayer()
        borderLayer.strokeColor = UIColor.gray30.cgColor
        borderLayer.lineDashPattern = [12, 4] // Длина и промежуток для прерывистой линии
        borderLayer.frame = bounds
        borderLayer.fillColor = UIColor.white.cgColor
        borderLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath // Учитываем скругление углов
        layer.addSublayer(borderLayer)
    }
}

