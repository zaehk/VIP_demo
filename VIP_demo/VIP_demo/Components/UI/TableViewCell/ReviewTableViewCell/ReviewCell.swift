//
//   ReviewCell.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 10/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

class ReviewCell: UITableViewCell, GetCellIdentifierProtocol {
    
    private let roundedContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = Constants.Styles.reviewBackgroundColor
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        return containerView
    }()
    
    private let mainVerticalStackView : UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        return stack
    }()
        
    private let authorInfoHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.spacing = 5
        stack.backgroundColor = .clear
        return stack
    }()
    
    private let reviewTextView : UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.isUserInteractionEnabled = false
        textView.font = .italicSystemFont(ofSize: 12)
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.textColor = Constants.Styles.reviewTextColor
        return textView
    }()
    
    private let authorlabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = Constants.Styles.reviewAuthorColor
        label.textAlignment = .left
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = Constants.Styles.ratingColor
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Variables
    
    private var collectionElements: [CollectionDrawerItemProtocol] = []
    private weak var delegate: MovieCategoryTapProtocol?
    private var categoryIdentifier: Any?
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupViewsConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reviewTextView.text = nil
        authorlabel.text = nil
        ratingLabel.text = nil
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
        addSubview(roundedContainerView)
        roundedContainerView.addSubview(mainVerticalStackView)
        
        mainVerticalStackView.addArrangedSubview(authorInfoHorizontalStackView)
        authorInfoHorizontalStackView.addArrangedSubview(authorlabel)
        authorInfoHorizontalStackView.addArrangedSubview(ratingLabel)
        mainVerticalStackView.addArrangedSubview(reviewTextView)
        
        roundedContainerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(20)
        }
        
        mainVerticalStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        
        reviewTextView.snp.makeConstraints { (make) in
            make.height.lessThanOrEqualTo(300)
        }
        
        authorInfoHorizontalStackView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }

    }

    //MARK: -Public cell setup methods
    
    func setMovieReview(text: String) {
        reviewTextView.text = text
    }
    
    func setAuthor(text: String) {
        self.authorlabel.text = String(format: Constants.MovieDetail.reviewAuthor, text)
    }
    
    func setRating(text: String) {
        self.ratingLabel.text = String(format: Constants.MovieDetail.rating, text)
        
    }

    
}
