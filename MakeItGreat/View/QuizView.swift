//
//  QuizView.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 30/11/22.
//

import UIKit

class QuizView: UIView {

    private lazy var textQuestion = make(UILabel()) {
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 24)
        $0.textColor = .systemGray2
        $0.numberOfLines = 0
    }

    private lazy var

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
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            textQuestion.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            textQuestion.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            textQuestion.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }

    func configureViews() {
        self.backgroundColor = .systemBackground
    }

}
