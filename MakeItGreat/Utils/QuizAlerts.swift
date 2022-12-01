//
//  QuizAlerts.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 01/12/22.
//

import UIKit
import Foundation

enum QuizAlerts {
    case correctAnswer
    case incorrectAnswer
}

extension QuizAlerts {
    func showAlert() -> UIAlertController {
        switch self {
        case .correctAnswer:
            return showCorrectAlert()
        case .incorrectAnswer:
            return showIncorrectAlert()
        }
    }
}

extension QuizAlerts {
    private func showCorrectAlert() -> UIAlertController {
        let trueAlert: UIAlertController = UIAlertController(title: "Acertou!",
                                                             message: "Você acertou o quiz, parabéns!",
                                                             preferredStyle: .alert
        )
        let action1: UIAlertAction = UIAlertAction(title: "Sair",
                                                   style: .default
        ) { _ in
            print("voce acertou")
        }
        trueAlert.addAction(action1)
        return trueAlert
    }

    private func showIncorrectAlert() -> UIAlertController {
        let falseAlert: UIAlertController = UIAlertController(
            title: "Errou!",
            message: "Infelizmente você não conseguiu, tente novamente!",
            preferredStyle: .alert
        )
        let action1: UIAlertAction = UIAlertAction(title: "Sair",
                                                   style: .default
        ) { _ in
            print("voce acertou")
        }
        falseAlert.addAction(action1)
        return falseAlert
    }
}
