//
//  QuizView.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 30/11/22.
//

import UIKit

class QuizView: UIView {

    private lazy var textQuestion = make(UILabel()) {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .systemTeal
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 24)
        $0.textColor = .systemGray6
        $0.numberOfLines = 0
    }

    private lazy var trueButton = make(QuizButton()) {
        $0.textButton = "Verdadeiro"
    }

    private lazy var falseButton = make(QuizButton()) {
        $0.textButton = "Falso"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView() {
        textQuestion.text = "Testando"
    }

}

extension QuizView: ViewCodeConfiguration {

    func buildHierarchy() {
        //
        addSubview(textQuestion)
        addSubview(trueButton)
        addSubview(falseButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // constraints textQuestion
            textQuestion.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            textQuestion.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textQuestion.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            textQuestion.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            // constraints true button
            trueButton.topAnchor.constraint(equalTo: textQuestion.bottomAnchor, constant: 25),
            trueButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            trueButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // constraints false button
            falseButton.topAnchor.constraint(equalTo: trueButton.bottomAnchor, constant: 15),
            falseButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            falseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    func configureViews() {
        self.backgroundColor = .systemBackground
    }

}
