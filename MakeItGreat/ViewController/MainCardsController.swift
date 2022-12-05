import UIKit

class MainCardsController: UIViewController {
    let mainView = MainCardsView()
    let cardView = CardView()

    override func loadView() {
        view = mainView


    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.didTapOnButtonHandler = { [weak self] in
            let nextViewController = CardViewController()
            self?.navigationController?.pushViewController(nextViewController, animated: true)
        }
        loadDataFromJson()
    }

    func loadDataFromJson() {
        guard let resources: QuizList = JsonManager.loadJson(path: "quiz_data") else { return }
    }
}
