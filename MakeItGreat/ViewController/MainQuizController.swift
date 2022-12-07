//
//  MainQuizController.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 30/11/22.
//

import UIKit
import Lottie

class MainQuizController: UIViewController {

    let indexQuiz = 8
    let quizView = QuizView()
    var quizList =  QuizList(quiz: [])

    override func loadView() {
        view = quizView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.quizList = loadQuiz()
        quizView.configureView(model: quizList.quiz[indexQuiz])
    }

    override func viewDidAppear(_ animated: Bool) {
        quizView.popView = {[weak self] in
            self?.navigationController?.dismiss(animated: true)
        }
        quizView.didTapAnswer = { [weak self] answer in
            guard let validateAnswer = self?.quizList.quiz[self!.indexQuiz].validateAnswer(answer: answer) else { return }
            print(validateAnswer)
            if validateAnswer {
                self?.quizView.setupLottieRight()
            }else {
                self?.quizView.setupLottieWrong()
            }
        }
    }

    func loadQuiz() -> QuizList {
        guard let data: QuizList = JsonManager.loadJson(path: "quiz_data") else { return QuizList(quiz: [])}
        return data
    }
}
