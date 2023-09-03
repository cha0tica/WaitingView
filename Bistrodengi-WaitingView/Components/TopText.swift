//
//  TopText.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 03.09.2023.
//

import Foundation

private var loanAmount = 100000
private var loanDays = 1
let dayForm = pluralForm(number: loanDays, forms: ["день", "дня", "дней"])
let loanLabelText = "\(loanAmount) ₽ на \(loanDays) \(dayForm)"

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
