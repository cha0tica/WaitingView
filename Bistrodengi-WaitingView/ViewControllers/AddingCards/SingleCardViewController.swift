//
//  SingleCardViewController.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 31.08.2023.
//

import Foundation
import UIKit

class SingleCardCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var paySystemImage: UIImageView!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var checkMarkImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
