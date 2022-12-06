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

    lazy var buttonQuiz = make(UIButton()) {
        $0.layer.cornerRadius = 20
        $0.setTitle("Valide Seu Conhecimento", for: .normal)
        $0.backgroundColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc func buttonAction(sender: UIButton!) {
        didTapQuizButton?()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

extension CardPlacerView: ViewCodeConfiguration {
    func buildHierarchy() {
        addSubview(cardView)
        addSubview(buttonQuiz)

    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // card constraints
            cardView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cardView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.5),
            cardView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),

            buttonQuiz.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 650),
            buttonQuiz.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            buttonQuiz.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -80),
            buttonQuiz.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -20)
            ])
    }

    func configureViews() {
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 15
    }


}

