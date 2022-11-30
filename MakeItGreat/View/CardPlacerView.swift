//
//  CardPlacerView.swift
//  MakeItGreat
//
//  Created by Gabriel Santiago on 30/11/22.
//

import UIKit

class CardPlacerView: UIView {
    let cardView = CardView()

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
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cardView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.5),
            cardView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
        ])
    }

    func configureViews() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 15
    }


}

