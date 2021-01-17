//
//   MovieDetailInfoCell.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 10/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

class MovieDetailInfoCell: UITableViewCell, GetCellIdentifierProtocol {
    
    private let movieBackdropImageView : CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let stackView : UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        return stack
    }()
    
    private let overViewTextView : UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.backgroundColor = .clear
        textView.textColor = Constants.Styles.textInfoColor
        return textView
    }()
    
    // MARK: - Variables
    
    private var collectionElements: [CollectionDrawerItemProtocol] = []
    private weak var delegate: MovieCategoryTapProtocol?
    private var categoryIdentifier: Any?
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        addSubview(stackView)
        stackView.addArrangedSubview(movieBackdropImageView)
        setupViewsConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieBackdropImageView.image = nil
        overViewTextView.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints setup
    
    private func setupViewsConstraints(){
        stackView.addArrangedSubview(movieBackdropImageView)
        stackView.addArrangedSubview(overViewTextView)

        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        movieBackdropImageView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(200)
        }

    }

    //MARK: -Public cell setup methods
    
    func setMovieOverview(text: String, size: CGFloat) {
        overViewTextView.text = text
        overViewTextView.font = UIFont.systemFont(ofSize: size)
    }
    
    func setMovieBackdropImage(imageURL: String, placeholder: UIImage?){
        self.movieBackdropImageView.loadImageUsingUrlString(urlString: imageURL, placeHolderImage: placeholder ?? UIImage())
    }
    
    func setMoviePlaceholder(image: UIImage?){
        self.movieBackdropImageView.image = image
    }

    
}
