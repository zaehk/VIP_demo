//
//   MovieCollectionViewCell.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, GetCollectionIdentifierProtocol {

        // MARK: - Views -

    let posterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
        // MARK: - Internal Methods -

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        addSubview(posterImageView)
        setupViewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupViewsConstraints(){
        posterImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().offset(15)
        }
    }

}
