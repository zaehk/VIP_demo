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
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let emptyStateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Constants.Styles.emptyStateImageTint
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .equalSpacing
        return stack
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

        self.addSubview(stackView)
        
        stackView.addArrangedSubview(emptyStateImageView)
        stackView.addArrangedSubview(emptyStateDescription)
        
        stackView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(20)
            make.centerX.centerY.equalToSuperview()
        }
        
        emptyStateDescription.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
        }
        
        emptyStateImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
        }
        
    }
    
    func setEmptyStateImage(image: UIImage?){
        self.emptyStateImageView.image = image
    }
    
    func setEmptyStateDescription(text: String){
        self.emptyStateDescription.text = text
    }
    
}
