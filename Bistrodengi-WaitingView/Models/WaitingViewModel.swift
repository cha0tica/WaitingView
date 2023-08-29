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
            return "Ваши документы сейчас на проверке"
        case .notEnoughTime:
            return "Извините за ожидание!"
        }
    }

    var mainText: String {
        switch self {
        case .documents:
            return "Обычно она занимает несколько минут, подождите пожалуйста"
        case .notEnoughTime:
            return "Нам нужно чуть больше времени для завершения проверки. \nВам придет Push-уведомление или CМС, когда проверка завершится"
        }
    }
}
