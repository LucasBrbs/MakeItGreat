//
//  CardPlacerView.swift
//  MakeItGreat
//
//  Created by Gabriel Santiago on 30/11/22.
//

import UIKit

class CardPlacerView: UIView {
    var didTapQuizButton: (() -> Void)?
    let cardView = CardView()

    private lazy var quizButton = make(QuizButton()) {
        $0.textButton = "teste"
        $0.addTarget(self, action: #selector(tapQuizButton), for: .touchUpInside)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tapQuizButton() {
        didTapQuizButton?()
        quizButton.setSelected()
    }
}

extension CardPlacerView: ViewCodeConfiguration {
    func buildHierarchy() {
        addSubview(cardView)
        addSubview(quizButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // card constraints
            cardView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cardView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.5),
            cardView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            // button constraints
            quizButton.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 15),
            quizButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            quizButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }

    func configureViews() {
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 15
    }


}

