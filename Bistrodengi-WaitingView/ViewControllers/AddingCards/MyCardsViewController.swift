//
//  MyCardsViewController.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 31.08.2023.
//

import Foundation
import UIKit

class MyCardsViewController : UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var cardTable: UITableView!
    @IBOutlet weak var loanLabel: UILabel!
    @IBOutlet weak var sendData: UIButton!
    
    //MARK: Vars
    var cardInfo = cardData()
    var digitsInfo = cardDigits()
    var selectedIndexPath: IndexPath?
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loanLabel.text = loanLabelText
        
        cardTable.dataSource = self
        cardTable.delegate = self
        
        //настройка внешнего вида таблицы
        cardTable.layer.cornerRadius = 16
        cardTable.clipsToBounds = true

        //настройка градиента кнопки
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 1, green: 0.61, blue: 0.29, alpha: 1).cgColor,
            UIColor(red: 0.96, green: 0.47, blue: 0.08, alpha: 1).cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = sendData.bounds
        
        sendData.layer.insertSublayer(gradientLayer, at: 0)
        sendData.setTitleColor(UIColor.white, for: .normal)
        sendData.layer.cornerRadius = sendData.bounds.height / 2
        sendData.clipsToBounds = true
        
        // Добавляем выделение по умолчанию для первой ячейки второй секции
        let indexPath = IndexPath(row: 0, section: 1)
        cardTable.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        cardTable.delegate?.tableView?(cardTable, didSelectRowAt: indexPath)
    }
}

//MARK: Table Extensions
extension MyCardsViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return digitsInfo.formattedCardNumbers.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell")!
            cell.backgroundColor = UIColor.white
            return cell
        }
        
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell") as! SingleCardCell
            
            let cardNumber = digitsInfo.formattedCardNumbers[indexPath.row]
            cell.cardNumberLabel.text = cardNumber
            cell.paySystemImage.image = UIImage(named: cardInfo.getCardSystemImageName(from: cardNumber))
            cell.cellView.layer.cornerRadius = 16
            cell.cellView.layer.borderWidth = 1
            cell.cellView.layer.borderColor = UIColor.gray20.cgColor
            cell.cellView.clipsToBounds = true
            cell.backgroundColor = UIColor.white
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addCard") as! AddCardCell
            cell.backgroundColor = UIColor.white
            
            //скругление снизу
            let maskPath = UIBezierPath(roundedRect: cell.bounds,
                                        byRoundingCorners: [.bottomLeft, .bottomRight],
                                        cornerRadii: CGSize(width: 16, height: 16))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = cell.bounds
            maskLayer.path = maskPath.cgPath
            cell.layer.mask = maskLayer
            return cell
        }
        
    }
}

extension MyCardsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? SingleCardCell {
            cell.cellView.layer.borderColor = UIColor.brandBlue.cgColor
            cell.cellView.layer.backgroundColor = UIColor.lightBlue.cgColor
            cell.checkMarkImage.image = UIImage(named: "checkmark-select")
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? SingleCardCell {
            cell.cellView.backgroundColor = .white
            cell.cellView.layer.borderColor = UIColor.gray20.cgColor
            cell.checkMarkImage.image = UIImage(named: "checkmark-deselect")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 12.0
        } else if indexPath.section == 1 {
            return 66.0
        } else {
            return 120.0
        }
    }
    
}

extension UITableView {
    
    func registerCellNib(forClass cellClass: AnyClass) {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: cellClass))
    }
}
