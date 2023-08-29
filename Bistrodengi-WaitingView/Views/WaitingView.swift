//
//  ViewController.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 27.08.2023.
//

import UIKit
import Foundation

class WaitingView: UIViewController {
    
    //MARK: Vars
    private var loanAmount = 100000
    private var loanDays = 1
    private var timer: Timer?
    private var remainingTime: Int = 5// * 60
    private var currentIndex: Int = 0
    
    var config: WaitingConfig = .documents {
            didSet {
                updateUI()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dayForm = pluralForm(number: loanDays, forms: ["день", "дня", "дней"])
        loanLabel.text = "\(loanAmount) ₽ на \(loanDays) \(dayForm)"
        
        startTimer()
        updateUI()
        basicAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.animationCircular()
    }
    
    //MARK: Labels
    @IBOutlet weak var loanLabel: UILabel!
    @IBAction func callMeButton(_ sender: Any) {
    }
    
    @IBOutlet weak var timerImage: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var headerMessage: UILabel!
    @IBOutlet weak var mainText: UILabel!
    
    //MARK: Days Logic
    
    func pluralForm(number: Int, forms: [String]) -> String {
        if number % 10 == 1 && number % 100 != 11 {
            return forms[0]
        } else {
            if (number % 10 >= 2 && number % 10 <= 4) && (number % 100 < 10 || number % 100 >= 20) {
                return forms[1]
            } else {
                return forms[2]
            }
        }
    }
    
    //MARK: Timer Logic
    func timeFormatted(_ totalSeconds: Int) -> String {
        let minutes: Int = totalSeconds / 60
        let seconds: Int = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func updateUI() {
        UIView.transition(with: timerImage, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.timerImage.image = self.config.image
        }, completion: nil)
        
        UIView.transition(with: headerMessage, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.headerMessage.text = self.config.headerMessage
        }, completion: nil)
        
        UIView.transition(with: mainText, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.mainText.text = self.config.mainText
        }, completion: nil)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.remainingTime -= 1
            self.timerLabel.text = self.timeFormatted(self.remainingTime)
            
            if self.remainingTime <= 0 {
                self.currentIndex = 1
                self.config = .notEnoughTime
                self.timer?.invalidate()
                self.timerLabel.isHidden = true
            }
        }
    }
    
    //MARK: Timer animation
   
    let shapeLayer = CAShapeLayer()
    
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
}

