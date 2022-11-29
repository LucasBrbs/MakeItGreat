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
