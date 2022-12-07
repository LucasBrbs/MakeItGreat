//
//  CardPlacerView.swift
//  MakeItGreat
//
//  Created by Gabriel Santiago on 30/11/22.
//

import UIKit

class CardPlacerView: UIView {
    var didTapQuizButton: (() -> Void)?
    let blur = UIBlurEffect(style: .dark)
    lazy var cardView = CardView()

    private lazy var quizButton = make(QuizButton()) {
        $0.textButton = "Valide seus conhecimentos!"
        $0.addTarget(self, action: #selector(tapQuizButton), for: .touchUpInside)
    }

    private lazy var opaqueView = make(UIImageView()) {
        $0.backgroundColor = .black
        $0.layer.opacity = 0.3
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    lazy var blurEffect = make(UIVisualEffectView(effect: blur)) {
        $0.frame = self.bounds
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(blurEffect)
        addSubview(opaqueView)
        sendSubviewToBack(blurEffect)
        sendSubviewToBack(opaqueView)
        addSubview(cardView)
        addSubview(quizButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // blur effect constraints
            blurEffect.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blurEffect.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            blurEffect.topAnchor.constraint(equalTo: self.topAnchor),
            blurEffect.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            // opaque view constraints
            opaqueView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            opaqueView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            opaqueView.topAnchor.constraint(equalTo: self.topAnchor),
            opaqueView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            // card constraints
            cardView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cardView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.5),
            cardView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            // button constraints
            quizButton.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 15),
            quizButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            quizButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7)
        ])
    }

    func configureViews() {
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 15
    }
}
