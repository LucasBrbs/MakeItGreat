//
//  MainQuizController.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 30/11/22.
//

import UIKit

class MainQuizController: UIViewController {

    let quizView = QuizView()

    override func loadView() {
        view = quizView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        quizView.configureView()
    }
}
