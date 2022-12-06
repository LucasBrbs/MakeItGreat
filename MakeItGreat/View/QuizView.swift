//
//  QuizView.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 30/11/22.
//

import UIKit
import Lottie

class QuizView: UIView {

    var didTapAnswer: ((_ answer: Bool) -> Void)?
    let animationView = LottieAnimationView()
    var popView: (() -> Void)?


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
        $0.addTarget(self, action: #selector(trueAnswer), for: .touchUpInside)
        $0.textButton = "Verdadeiro"
    }

    private lazy var falseButton = make(QuizButton()) {
        $0.addTarget(self, action: #selector(falseAnswer), for: .touchUpInside)
        $0.textButton = "Falso"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView(model: Quiz) {
        textQuestion.text = model.question.textQuestion
    }

    @objc func trueAnswer() {
        didTapAnswer?(true)
        falseButton.setDeselected()
        trueButton.setSelected()
    }

    @objc func falseAnswer() {
        didTapAnswer?(false)
        falseButton.setSelected()
        trueButton.setDeselected()
    }

    func setupLottieRight() {
        animationView.animation = LottieAnimation.named("right-lottie2")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1.0
        animationView.play { _ in
            self.animationView.isHidden = true
            self.popView?()
        }
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalToConstant: 200),
            animationView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    func setupLottieWrong() {
        animationView.animation = LottieAnimation.named("wrong-lottie2")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1.0
        animationView.play { _ in
            self.animationView.isHidden = true
            self.popView?()
        }
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalToConstant: 150),
            animationView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }


}

extension QuizView: ViewCodeConfiguration {

    func buildHierarchy() {
        addSubview(textQuestion)
        addSubview(trueButton)
        addSubview(falseButton)
        addSubview(animationView)
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
            falseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // constraints animation view
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200),
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func configureViews() {
        self.backgroundColor = .systemBackground
    }
}
