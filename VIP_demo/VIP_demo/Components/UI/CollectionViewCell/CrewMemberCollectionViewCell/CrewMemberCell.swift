//
//   CrewMemberCell.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 09/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.
//

import UIKit

class CrewMemberCell: UICollectionViewCell, GetCollectionIdentifierProtocol {

        // MARK: - Views -
    
    private let crewMemberImageView : CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let stackView : UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    private let crewMemberNameLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.textColor = Constants.Styles.textInfoColor
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let crewMemberRoleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 10)
        titleLabel.textColor = Constants.Styles.textInfoColor
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.crewMemberImageView.image = nil
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        addSubview(stackView)
        setupViewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupViewsConstraints(){
        stackView.addArrangedSubview(crewMemberImageView)
        stackView.addArrangedSubview(crewMemberNameLabel)
        stackView.addArrangedSubview(crewMemberRoleLabel)

        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        crewMemberImageView.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalTo(66)
        }
        
        crewMemberRoleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(5)
        }

        crewMemberNameLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(5)
        }
    }
    
    // MARK: - Public draw methods
    
    func setMemberName(name: String){
        self.crewMemberNameLabel.text = name
    }
    
    func setMemberRole(role: String){
        self.crewMemberRoleLabel.text = role
    }
    
    func setMemberImage(url: String, placeHolderImage: UIImage?){
        self.crewMemberImageView.contentMode = .scaleAspectFill
        self.crewMemberImageView.loadImageUsingUrlString(urlString: url, placeHolderImage: placeHolderImage)
    }
    
    func setPlaceholderImage(image: UIImage?){
        self.crewMemberImageView.contentMode = .scaleAspectFit
        self.crewMemberImageView.image = image
    }

}
