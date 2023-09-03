//
//  TimerAnimations.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 03.09.2023.
//

import Foundation
import UIKit


//MARK: Timer animation

let shapeLayer = CAShapeLayer()

extension WaitingViewController {
    func animationCircular(){
        
        let endAngle = (-CGFloat.pi / 2)
        let startAngle = 2 * CGFloat.pi + endAngle
        let center = CGPoint(x: view.center.x - 11, y: 338)
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 61, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 3
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = UIColor.paleBlue.cgColor
        view.layer.addSublayer(shapeLayer)
    }
    
    func basicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(remainingTime)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
    
    //MARK: Animated Digits
    func updateTimerLabel() {
        view.addSubview(countdownLabel)
        
        countdownLabel.translatesAutoresizingMaskIntoConstraints = false
        countdownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -11).isActive = true
        countdownLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 340).isActive = true
        
        countdownLabel.font = UIFont(name: "Rubik-Bold", size: 32)
        countdownLabel.textColor = .white
        countdownLabel.timeFormat = "mm:ss"
        
        countdownLabel.animationType = .Evaporate
        countdownLabel.start()
    }
}
