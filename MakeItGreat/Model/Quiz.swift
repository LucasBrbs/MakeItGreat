//
//  Quiz.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 29/11/22.
//

import Foundation

struct Quiz: Codable {
    let id: String
    let question: Question

    enum CodingKeys: String, CodingKey {
        case id
        case question = "questao"
    }

    func validateAnswer(answer: Bool) -> Bool {
        if Bool(question.correctAnswer)! == answer {
            return true
        }
        return false
    }
}
