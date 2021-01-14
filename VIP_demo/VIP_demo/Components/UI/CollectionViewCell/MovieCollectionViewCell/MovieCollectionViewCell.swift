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

    private let posterImageView : CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = Constants.Styles.mainColor
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let movieTitleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.textColor = Constants.Styles.textInfoColor
        return titleLabel
    }()
    
        // MARK: - Internal Methods -

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        addSubview(posterImageView)
        addSubview(movieTitleLabel)
        setupViewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        movieTitleLabel.text = nil
    }
    
    private func setupViewsConstraints(){
        posterImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(90)
        }
        
        movieTitleLabel.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(posterImageView)
        }
        
    }
    
    // MARK: - Public draw methods
    
    func setMovieTitle(title: String){
        self.movieTitleLabel.text = title
    }
    
    func setMoviePosterImage(url: String){
        self.posterImageView.loadImageUsingUrlString(urlString: url, placeHolderImage: UIImage())
    }

}
