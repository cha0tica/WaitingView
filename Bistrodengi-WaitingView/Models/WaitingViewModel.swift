//
//  WaitingViewModel.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 27.08.2023.
//

import Foundation

import UIKit

enum WaitingConfig {
    case documents
    case notEnoughTime

    var image: UIImage {
        switch self {
        case .documents:
            return UIImage(named: "empty-timer")!
        case .notEnoughTime:
            return UIImage(named: "longer-timer")!
        }
    }

    var headerMessage: String {
        switch self {
        case .documents:
            return "Ваша заявка скоро будет одобрена!"
        case .notEnoughTime:
            return "Нужно чуть больше времени"
        }
    }

    var mainText: String {
        switch self {
        case .documents:
            return "Пожалуйста, не закрывайте приложение, чтобы увидеть решение по вашей заявке."
        case .notEnoughTime:
            return "Вам придет Push-уведомление или CМС, когда ваша заявка будет одобрена. \nПриносим извинения за доставленные неудобства."
        }
    }
}
