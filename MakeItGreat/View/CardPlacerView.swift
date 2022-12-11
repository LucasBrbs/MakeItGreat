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
    lazy var cardViewa = CardView()

    lazy var buttonQuiz = make(QuizButton()) {
        $0.cornerRadius = 20
        $0.textButton = "Valide seu conhecimento!"
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemRed
        $0.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        didTapQuizButton?()
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


}

extension CardPlacerView: ViewCodeConfiguration {
    func buildHierarchy() {
        addSubview(blurEffect)
        addSubview(opaqueView)
        sendSubviewToBack(blurEffect)
        sendSubviewToBack(opaqueView)
        addSubview(cardViewa)
        addSubview(buttonQuiz)

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
            cardViewa.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cardViewa.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardViewa.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.5),
            cardViewa.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            // button constraints
            buttonQuiz.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonQuiz.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            buttonQuiz.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            buttonQuiz.topAnchor.constraint(equalTo: cardViewa.bottomAnchor, constant: 20)
        ])
    }

    func configureViews() {
        cardViewa.layer.masksToBounds = true
        cardViewa.layer.cornerRadius = 25
    }
}
