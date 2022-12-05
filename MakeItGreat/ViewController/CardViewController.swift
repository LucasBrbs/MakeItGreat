//
//  CardViewController.swift
//  MakeItGreat
//
//  Created by Gabriel Santiago on 30/11/22.
//

import UIKit

class CardViewController: UIViewController {

    let cardPlacerView = CardPlacerView()

    override func loadView() {
        self.view = cardPlacerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let cardData = loadCards()
        cardPlacerView.cardView.configure(model: cardData.card[0])
    }

    override func viewDidAppear(_ animated: Bool) {
        cardPlacerView.didTapQuizButton = { [weak self] in
            let nextController = MainQuizController()
            self?.navigationController?.pushViewController(nextController, animated: true)
        }
    }

    func loadCards() -> CardModelList{
        guard let resources: CardModelList = JsonManager.loadJson(path: "card_data") else { return CardModelList(card: []) }
        return resources
    }
}
