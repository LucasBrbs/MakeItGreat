//
//  QuizButton.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 30/11/22.
//

import UIKit

class QuizButton: UIButton {

    var cornerRadius: CGFloat = 15
    var textButton: String = "" {
        didSet {
            self.setTitle(textButton, for: .normal)
        }
    }
    var selectedColor: UIColor = UIColor.systemGreen
    var deselectedColor: UIColor = UIColor.systemGray6
    var active: Bool = false

    init() {
        super.init(frame: .zero)
        self.backgroundColor = deselectedColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true

        if active {
            setSelected()
        } else {
            setDeselected()
        }

        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }

    @objc func onPress() {
        active.toggle()

        if active {
            setSelected()
        } else {
            setDeselected()
        }
    }

    func setSelected() {
        self.setTitleColor(UIColor.systemGray6, for: .normal)
        self.backgroundColor = selectedColor
    }

    func setDeselected() {
        self.setTitleColor(UIColor.systemGray2, for: .normal)
        self.backgroundColor = deselectedColor
    }

}
