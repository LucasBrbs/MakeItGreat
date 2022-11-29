import UIKit

class MainCardsController: UIViewController {

    let mainView = MainCardsView()
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
