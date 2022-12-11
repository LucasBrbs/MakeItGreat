//
//  CardViewController.swift
//  MakeItGreat
//
//  Created by Gabriel Santiago on 30/11/22.
//

import UIKit

class CardViewController: UIViewController {

    let cardPlacerView = CardPlacerView()

    let number: Int

    init(number: Int) {
        self.number = number
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    

    override func loadView() {
        self.view = cardPlacerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let cardData = loadCards()
        cardPlacerView.cardViewa.configure(model: cardData.card[number])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cardPlacerView.cardViewa.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }

    override func viewDidAppear(_ animated: Bool) {
        animateCard()
        let blurViewTap = UITapGestureRecognizer(target: self, action: #selector(touchedBlurView(_:)))
        cardPlacerView.blurEffect.addGestureRecognizer(blurViewTap)
        cardPlacerView.blurEffect.isUserInteractionEnabled = true
        cardPlacerView.didTapQuizButton = { [weak self] in
            guard let self else { return }
            let nextController = MainQuizController(number: self.number)
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }

    @objc func touchedBlurView(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.dismiss(animated: false)
        }
    }

    func animateCard() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            animations: { [self] in
                cardPlacerView.cardViewa.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
    }

    func loadCards() -> CardModelList{
        guard let resources: CardModelList = JsonManager.loadJson(path: "card_data") else { return CardModelList(card: []) }
        return resources
    }
}
