//
//  ViewController.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 27.08.2023.
//

import UIKit
import Foundation
import CountdownLabel

class WaitingViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var loanLabel: UILabel!
    @IBAction func callMeButton(_ sender: Any) {
    }
    
    @IBOutlet weak var timerImage: UIImageView!
    @IBOutlet weak var headerMessage: UILabel!
    @IBOutlet weak var mainText: UILabel!
    
    //MARK: Vars
    
    private var timer: Timer?
    var remainingTime: Int = 5 * 60
    private var currentIndex: Int = 0
    let countdownLabel = CountdownLabel()
    
    var config: WaitingConfig = .documents {
        didSet {
            updateUI()
        }
    }
    
   //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loanLabel.text = loanLabelText
        
        startTimer()
        updateUI()
        basicAnimation()
        updateTimerLabel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.animationCircular()
    }
    
    deinit {
        invalidateTimer()
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
            self.countdownLabel.text = self.timeFormatted(self.remainingTime)
            
            if self.remainingTime <= 0 {
                self.currentIndex = 1
                self.config = .notEnoughTime
                self.timer?.invalidate()
                self.countdownLabel.isHidden = true
            }
        }
    }
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
}

