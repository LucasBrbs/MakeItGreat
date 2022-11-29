//
//  LoadJsonTests.swift
//  MakeItGreatTests
//
//  Created by Paulo Henrique Gomes da Silva on 29/11/22.
//
@testable import MakeItGreat
import XCTest

final class LoadJsonTests: XCTestCase {

    func test_service_serviceResultIsSuccess_with_quiz() throws {
        let mockAnswer = "false"
        guard let loadedJson: QuizList = JsonManager.loadJson(path: "quiz_data") else { return }
        XCTAssertNotNil(loadedJson)
        XCTAssertEqual(loadedJson.quiz[0].question.correctAnswer, mockAnswer)
    }

    func test_service_serviceResultIsNil() throws {
        let loadedJson: QuizList? = JsonManager.loadJson(path: "")
        print(loadedJson)
        XCTAssertNil(loadedJson)
    }
}
