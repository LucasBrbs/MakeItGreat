import UIKit

public class CollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CollectionViewCell"
    
    let imageHeart: UIImageView = {
        let heart: UIImageView = UIImageView(image: UIImage(named: "Rectangle"))
        heart.translatesAutoresizingMaskIntoConstraints = false
        heart.contentMode = .scaleToFill
        
        return heart
    }()
    
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
        self.contentView.addSubview(self.imageHeart)
        self.contentView.addSubview(self.progressBar)
        self.backgroundColor = .systemBackground
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        leadingAnchorConstraint =  imageHeart.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 50)
        trailingAnchorConstraint = imageHeart.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -240)
        NSLayoutConstraint.activate([
            leadingAnchorConstraint,
            trailingAnchorConstraint,
            self.imageHeart.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageHeart.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.imageHeart.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        NSLayoutConstraint.activate([
            self.progressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.progressBar.centerYAnchor.constraint(equalTo: self.imageHeart.centerYAnchor),
            self.progressBar.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
}
