//
//   MovieCollectionViewViewModel.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class MovieCollectionViewCellModel {
    
    var movieTitle: String
    var moviePosterUrl: String?
    
    init(movieResponseModel: MovieResultResponseModel){
        self.movieTitle = movieResponseModel.title ?? ""
        
        if let posterEndpoint = movieResponseModel.posterPath {
            self.moviePosterUrl = MoviePosterSizes.medium.getFullUrlForSize(endpoint: posterEndpoint)
        }
        
    }
}

// MARK: - DrawerItemProtocol -

extension MovieCollectionViewCellModel: CollectionDrawerItemProtocol {
    var collectionDrawer: CollectionDrawerProtocol {
        return MovieCollectionViewDrawer()
    }
}
