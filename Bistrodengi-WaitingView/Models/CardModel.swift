//
//  CardModel.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 31.08.2023.
//

import Foundation

class cardData {
    struct cardModel {
        var cardSystemImage : String
        var cardNumber : String
    }
    
    func getCardSystemImageName(from cardNumber: String) -> String {
        let cleanedCardNumber = cardNumber.filter { $0.isNumber }
        if let firstDigit = cleanedCardNumber.first {
            switch firstDigit {
            case "2":
                return "card-system-mir"
            case "4":
                return "card-system-visa"
            case "5":
                return "card-system-mastercard"
            case "6":
                return "card-system-unionpay"
            default:
                return "card-system-unknown"
            }
        } else {
            return "card-system-Unknown"
        }
    }
}

class cardDigits {
    let mockCardNumbers = ["257805xxxxxx3717",
                           "534951xxxxxx3957",
                           "450483xxxxxx2498"]
    
    var formattedCardNumbers: [String] = []

    init() {
        formatCardNumbers()
    }

    func formatCardNumbers() {
        formattedCardNumbers = mockCardNumbers.map { cardNumber in
            let replaced = cardNumber.replacingOccurrences(of: "x", with: "*")

            let chunks = replaced.enumerated().map { (index, char) in
                return index % 4 == 0 ? " " + String(char) : String(char)
            }

            return chunks.joined()
        }
    }
}
