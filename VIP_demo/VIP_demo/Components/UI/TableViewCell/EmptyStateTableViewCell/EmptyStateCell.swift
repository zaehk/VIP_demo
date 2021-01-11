//
//   EmptyStateCell.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 11/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

class EmptyStateCell: UITableViewCell, GetCellIdentifierProtocol {
    

    private let emptyStateDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let emptyStateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Constants.Styles.emptyStateImageTint
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupViewsConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        emptyStateDescription.text = nil
        emptyStateImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    // MARK: - Constraints setup
    
    private func setupViewsConstraints(){

        self.addSubview(emptyStateImageView)
        self.addSubview(emptyStateDescription)
        
        emptyStateImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().offset(20)
        }
        
        emptyStateDescription.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
            make.top.equalTo(emptyStateImageView.snp.bottom).inset(30)
        }
        
    }
    
    func setEmptyStateImage(image: UIImage?){
        self.emptyStateImageView.image = image
    }
    
    func setEmptyStateDescription(text: String){
        self.emptyStateDescription.text = text
    }
    
}
