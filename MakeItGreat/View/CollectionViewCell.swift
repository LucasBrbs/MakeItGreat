import UIKit

public class CollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CollectionViewCell"

    
    var cardScreen = make(CardView()) {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 7
        $0.translatesAutoresizingMaskIntoConstraints = false

    }

    let progressBar: UIImageView = {
        let progress: UIImageView = UIImageView(image: UIImage(named: "FrameBar"))
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.contentMode = .scaleToFill
        return progress
    }()
    
    var leadingAnchorConstraint: NSLayoutConstraint!
    var trailingAnchorConstraint: NSLayoutConstraint!
    
    private func cardLeft() {
        leadingAnchorConstraint.constant = 240
        trailingAnchorConstraint.constant = -50
    }
    
    private func cardRight() {
        leadingAnchorConstraint.constant = 50
        trailingAnchorConstraint.constant = -240
    }
    
    func configureSide(indexPath: IndexPath) {
        if((indexPath.row)%2 == 0 ){
            self.cardRight()
        }
        else if(indexPath.row == 10) {
            self.cardLeft()
        }
        else if(indexPath.row == 0) {
            self.cardLeft()
        }
        else {
            self.cardLeft()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.cardScreen)
        self.contentView.addSubview(self.progressBar)
        self.backgroundColor = .systemBackground
        self.configConstraints()

        cardScreen.configure(model: <#T##CardModel#>)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        leadingAnchorConstraint =  cardScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 50)
        trailingAnchorConstraint = cardScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -240)
        NSLayoutConstraint.activate([
            leadingAnchorConstraint,
            trailingAnchorConstraint,
            self.cardScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.cardScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.cardScreen.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        NSLayoutConstraint.activate([
            self.progressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.progressBar.centerYAnchor.constraint(equalTo: self.cardScreen.centerYAnchor),
            self.progressBar.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
}
