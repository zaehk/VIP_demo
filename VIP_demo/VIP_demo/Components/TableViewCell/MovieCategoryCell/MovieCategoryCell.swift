//
//   MovieCategoryCell.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit
import SnapKit

class MovieCategoryCell: UITableViewCell, GetCellIdentifierProtocol {
    
    private let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private let moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView.init(frame: CGRect.init(), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets.init(top: 10, left: 20, bottom: 10, right: 20)
        return collectionView
    }()
    
    // MARK: - Variables
    
    var collectionElements : [CollectionDrawerItemProtocol] = []
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        addSubview(categoryTitleLabel)
        addSubview(moviesCollectionView)
        setupCollectionView()
        setupViewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView(){
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
    }
    
    // MARK: - Constraints setup
    
    private func setupViewsConstraints(){
        
        categoryTitleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(10)
        }
        
        moviesCollectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(categoryTitleLabel.snp.bottom)
            make.height.equalTo(150)
        }
    }

    //MARK: -Public draw methods
    
    func setCategoryTitleLabelText(text: String) {
        categoryTitleLabel.text = text
    }
    
    func setCollectionElementsToShow(cells: [CollectionDrawerItemProtocol]) {
        self.collectionElements = cells
        moviesCollectionView.reloadData()
    }
    
}

//MARK: - CollectionView management

extension MovieCategoryCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionElements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = collectionElements[indexPath.row]
        let drawer = cellModel.collectionDrawer
        let cell = drawer.dequeueCollectionCell(collectionView, indexPath: indexPath)
        drawer.drawCollectionCell(cell, withItem: cellModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}
