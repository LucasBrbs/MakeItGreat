//
//  Questions.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 29/11/22.
//

import Foundation

struct Question: Codable {
    let textQuestion, textHelper, correctAnswer: String

    enum CodingKeys: String, CodingKey {
        case textQuestion = "texto_pergunta"
        case textHelper = "ajuda"
        case correctAnswer = "resposta"
    }
}
