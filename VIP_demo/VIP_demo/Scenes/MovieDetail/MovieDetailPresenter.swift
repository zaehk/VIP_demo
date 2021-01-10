//
//  MovieDetailPresenter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.

import UIKit

protocol MovieDetailPresentationLogic
{
    func presentMovieInfo(movieDetail: MovieDetailResponseModel, casting: [MovieCastMemberResponseModel], crew: [MovieCastMemberResponseModel], reviews: [ReviewResultResponseModel])
    func onGetMovieDetailFailed()
}

class MovieDetailPresenter
{
  weak var viewController: MovieDetailDisplayLogic?
}

extension MovieDetailPresenter: MovieDetailPresentationLogic {
    
    func presentMovieInfo(movieDetail: MovieDetailResponseModel, casting: [MovieCastMemberResponseModel], crew: [MovieCastMemberResponseModel], reviews: [ReviewResultResponseModel]) {
        
        var cells: [MovieCategoryCellModel] = []
        
        //create movieDetailCell
        let movieInfoViewModel = MovieInfoViewModel.init(movieDetailResponseModel: movieDetail)
        
        if !casting.isEmpty {
            let castingViewModels: [MovieCastMemberViewModel] = casting.map({MovieCastMemberViewModel.init(castResponseModel: $0)})
            let castingCells: [CollectionDrawerItemProtocol] = castingViewModels.map({CrewMemberCellModel.init(castVM: $0)})
            cells.append(MovieCategoryCellModel.init(title: Constants.MovieDetailCategories.actors, elementsToDisplay: castingCells, additionalInfo: MovieDetailCategories.actors, titleSize: 15))
        }
        
        if !crew.isEmpty {
            let crewViewModels: [MovieCastMemberViewModel] = crew.map({MovieCastMemberViewModel.init(castResponseModel: $0)})
            let crewCells: [CollectionDrawerItemProtocol] = crewViewModels.map({CrewMemberCellModel.init(castVM: $0)})
            cells.append(MovieCategoryCellModel.init(title: Constants.MovieDetailCategories.crew, elementsToDisplay: crewCells, additionalInfo: MovieDetailCategories.crew, titleSize: 15))
        }

        viewController?.displayMovieInfo(viewModel: MovieDetailViewModel.init(movieTitle: movieInfoViewModel.title, movieDetailCells: cells))
    }
    
    func onGetMovieDetailFailed() {
        
    }
    
}
