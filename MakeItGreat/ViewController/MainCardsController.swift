import UIKit

class MainCardsController: UIViewController {
    let mainView = MainCardsView()
    let card = CardModel(id: "1", funcao: "rato", poder: "trash", descricao: "aaaaaaaaaaaaaaaaaa", titulo: "Presidente")

    
    
    override func loadView() {
        view = mainView
        mainView.didTapOnButtonHandler = { [weak self] in
            let nextViewController = CardViewController()
            self?.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadDataFromJson()

    }
    func loadDataFromJson() {
        guard let resources: QuizList = JsonManager.loadJson(path: "quiz_data") else { return }
    }
}
