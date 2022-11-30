import UIKit

class MainCardsController: UIViewController {

    let mainView = MainCardsView()
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadDataFromJson()

    }
    func loadDataFromJson() {
        guard let resources: QuizList = JsonManager.loadJson(path: "quiz_data") else { return }
        print(resources.quiz[0].question.textQuestion)
    }
}
