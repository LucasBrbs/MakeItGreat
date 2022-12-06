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
        cardPlacerView.cardView.configure(model: cardData.card[number])
    }

    override func viewDidAppear(_ animated: Bool) {
        cardPlacerView.didTapQuizButton = { [weak self] in
            guard let self else { return }
            let nextController = MainQuizController(number: self.number)
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }

    func loadCards() -> CardModelList{
        guard let resources: CardModelList = JsonManager.loadJson(path: "card_data") else { return CardModelList(card: []) }
        return resources
    }
}
