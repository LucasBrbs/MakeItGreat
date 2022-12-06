import UIKit

class MainCardsController: UIViewController {
    let mainView = MainCardsView()
    let cardView = CardView()

    override func loadView() {
        view = mainView


    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.didTapOnButtonHandler = { [weak self] item in
            print(item)
            let nextViewController = CardViewController(number: item)
            self?.navigationController?.pushViewController(nextViewController, animated: true)
        }

    }


}
