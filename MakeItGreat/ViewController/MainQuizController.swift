//
//  MainQuizController.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 30/11/22.
//

import UIKit

class MainQuizController: UIViewController {

    let quizView = QuizView()
    var quizList =  QuizList(quiz: [])

    override func loadView() {
        view = quizView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.quizList = loadQuiz()
        quizView.configureView(model: quizList.quiz[0])
    }

    override func viewDidAppear(_ animated: Bool) {
        quizView.didTapAnswer = { [weak self] answer in
            let validateAnswer = self?.quizList.quiz[0].validateAnswer(answer: answer)
            print(validateAnswer!)
        }
    }

    func loadQuiz() -> QuizList {
        guard let data: QuizList = JsonManager.loadJson(path: "quiz_data") else { return QuizList(quiz: [])}
        return data
    }
}
