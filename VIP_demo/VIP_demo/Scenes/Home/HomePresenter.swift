//
//  HomePresenter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 03/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

protocol HomePresentationLogic
{
    func onGetMoviesForHomeSucceed(popular: [MovieResultResponseModel], topRated: [MovieResultResponseModel], nowPlaying: [MovieResultResponseModel])
    func onGetMoviesForHomeAllFailed()
}

class HomePresenter
{
  weak var viewController: HomeDisplayLogic?
  
  
}

//MARK: -Presentation logic implementation

extension HomePresenter: HomePresentationLogic {
    
    func onGetMoviesForHomeSucceed(popular: [MovieResultResponseModel], topRated: [MovieResultResponseModel], nowPlaying: [MovieResultResponseModel]) {
        
        //parse response models to collection cell models displayed inside of every category tableviewcell
        
        var categoryCells = [DrawerItemProtocol]()
        
        if !popular.isEmpty{
            let popularCells : [CollectionDrawerItemProtocol] = popular.map({MovieCollectionViewCellModel.init(movieResponseModel: $0)})
            categoryCells.append(MovieCategoryCellModel.init(title: MovieCategory.popular.title, elementsToDisplay: popularCells))
        }
        
        if !topRated.isEmpty{
            let topRatedCells : [CollectionDrawerItemProtocol] = topRated.map({MovieCollectionViewCellModel.init(movieResponseModel: $0)})
            categoryCells.append(MovieCategoryCellModel.init(title: MovieCategory.topRated.title, elementsToDisplay: topRatedCells))
        }
        
        if !nowPlaying.isEmpty{
            let nowPlayingCells : [CollectionDrawerItemProtocol] = nowPlaying.map({MovieCollectionViewCellModel.init(movieResponseModel: $0)})
            categoryCells.append(MovieCategoryCellModel.init(title: MovieCategory.newReleases.title, elementsToDisplay: nowPlayingCells))
        }
        
        
        let viewModel = HomeViewModel.init(movieCategories: categoryCells)
        viewController?.loadCategoriesAndMovies(viewModel: viewModel)
        
    }
    
    func onGetMoviesForHomeAllFailed() {
        
        
        
        
    }
    
    
    

}
