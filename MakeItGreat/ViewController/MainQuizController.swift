//
//  MainQuizController.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 30/11/22.
//

import UIKit
import Lottie

class MainQuizController: UIViewController {

    var didTapQuizHandler: ((Int) -> Void)?

    var number: Int

    init(number: Int) {
        self.number = number
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        nil
    }

    let quizView = QuizView()
    var quizList =  QuizList(quiz: [])

    override func loadView() {
        view = quizView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.quizList = loadQuiz()
        quizView.configureView(model: self.quizList.quiz[number])
    }

    override func viewDidAppear(_ animated: Bool) {
        quizView.popView = {[weak self] in
            self?.navigationController?.dismiss(animated: true)
        }
        quizView.didTapAnswer = { [weak self] answer in
            guard let self else { return }
            let validateAnswer = self.quizList.quiz[self.number].validateAnswer(answer: answer)
            print(validateAnswer)
            if validateAnswer {
                self.quizView.setupLottieRight()
            }else {
                self.quizView.setupLottieWrong()
            }
        }
    }


    func loadQuiz() -> QuizList {
        guard let data: QuizList = JsonManager.loadJson(path: "quiz_data") else { return QuizList(quiz: [])}
        return data
    }
}
