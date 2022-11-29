//
//  MainController.swift
//  MakeItGreat
//
//  Created by Lucas Barbosa de Oliveira on 29/11/22.
//

import UIKit

class MainController: UIViewController {

    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
