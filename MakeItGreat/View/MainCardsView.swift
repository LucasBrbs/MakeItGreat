//
//  ViewController.swift
//  MakeItGreat
//
//  Created by Lucas Barbosa de Oliveira on 21/11/22.
//

import UIKit

class MainCardsView: UIView {

    private var cont:Int = 0
    var didTapOnButtonHandler: (() -> Void)?

    lazy var collectionView = make(UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBackground
        $0.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        
        $0.setCollectionViewLayout(layout, animated: false)
        $0.delegate = self
        $0.dataSource = self
        
    }
    
    func scrollToItem(
            at indexPath: IndexPath,
            at scrollPosition: UICollectionView.ScrollPosition,
            animated:Bool
    ){}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainCardsView: ViewCodeConfiguration {
    func buildHierarchy() {
        self.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configureViews() {
        self.backgroundColor = .systemBackground
    }
}

extension MainCardsView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(cont == 0){
            collectionView.scrollToItem(at: IndexPath(row: 10, section: 0), at: .bottom, animated: true)
                cont += 1
        } else { }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        
        cell?.configureSide(indexPath: indexPath)
                
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
        }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didTapOnButtonHandler?()
//        if(indexPath.row == 1) {
//            print("aaaa")
//        } else {
//            print("bbbbb")
//
//        }
    }
}
