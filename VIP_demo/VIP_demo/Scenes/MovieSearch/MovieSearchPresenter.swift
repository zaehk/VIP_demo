//
//  MovieSearchPresenter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 10/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MovieSearchPresentationLogic
{
    func presentMatchingMovies(movies: [MovieResultResponseModel])
    func presentNoMoviesFoundOrError()
}

class MovieSearchPresenter: MovieSearchPresentationLogic
{
    
    weak var viewController: MovieSearchDisplayLogic?
    
    //service success
    func presentMatchingMovies(movies: [MovieResultResponseModel]) {
            let movieCollectionCells: [CollectionDrawerItemProtocol] = movies.map({MovieCollectionViewCellModel.init(movieResponseModel: $0)})
            let successViewModel = MovieSearchViewModel.init(movies: movieCollectionCells)
            viewController?.showResultMovies(viewModel: successViewModel)
    }
    
    //service error
    func presentNoMoviesFoundOrError() {
        presentEmptyStateOrError()
    }
    
    private func presentEmptyStateOrError(){
        let emptyStateCell = [EmptyStateCollectionCellModel.init(emptyState: .search)]
        let viewModel = MovieSearchViewModel.init(movies: emptyStateCell)
        viewController?.showNoMoviesFoundOrError(viewModel: viewModel)
    }
}
