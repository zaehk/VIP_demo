//
//   MovieCategoryCell.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit
import SnapKit

class MovieCategoryCell: UITableViewCell, GetCellIdentifierProtocol {
    
    private var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private var moviesCollectionView: UICollectionView = {
        let collectionView = UICollectionView.init(frame: CGRect.init(), collectionViewLayout: .init())
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    var collectionElements : [CollectionDrawerItemProtocol] = []
    
    // MARK: - IBOutlets -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(categoryTitleLabel)
        addSubview(moviesCollectionView)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        categoryTitleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(10)
        }
        
        moviesCollectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(categoryTitleLabel.snp.bottom)
            make.height.equalTo(200)
        }
    }

    //MARK: -Public draw methods
    
    func setCategoryTitleLabelText(text: String) {
        categoryTitleLabel.text = text
    }
    
    func setCollectionElementsToShow(cells: [CollectionDrawerItemProtocol]) {
        
    }
    
}
