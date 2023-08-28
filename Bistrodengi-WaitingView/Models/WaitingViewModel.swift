//
//  WaitingViewModel.swift
//  Bistrodengi-WaitingView
//
//  Created by Agata on 27.08.2023.
//

import Foundation

struct WaitingComponents {
    let image: String
    let headerMessage: String
    let mainText: String
}

var waitingModel = [
WaitingComponents(image: "Timer", headerMessage: "Ваши документы сейчас на проверке", mainText: "Обычно она занимает несколько минут, подождите пожалуйста"),
WaitingComponents(image: "LongerTimer", headerMessage: "Извините за ожидание!", mainText: "Нам нужно чуть больше времени для завершения проверки. \nВам придет Push-уведомление или CМС, когда проверка завершится")]
