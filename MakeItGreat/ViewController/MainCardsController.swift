import UIKit

class MainCardsController: UIViewController {
    let mainView = MainCardsView()
    let cardView = CardPlacerView()

    override func loadView() {
        view = mainView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.didTapOnButtonHandler = { [weak self] in
            let nav = UINavigationController(rootViewController: CardViewController())
            nav.modalPresentationStyle = .overFullScreen
            self?.present(nav, animated: false)
        }
    }

    func loadDataFromJson() -> QuizList {
        guard let resources: QuizList = JsonManager.loadJson(path: "quiz_data") else { return QuizList(quiz: []) }
//        print(resources.quiz[0].question.textQuestion)
        return resources
    }
}
