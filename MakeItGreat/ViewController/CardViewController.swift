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

    }
}
