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
        loadCards()

    }
    func loadCards() {
        guard let resources: CardModelList = JsonManager.loadJson(path: "card_data") else { return }
        print(resources.card[0].titulo)
    }
}
