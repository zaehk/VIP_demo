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
    func onGetMoviesForHomeSucceed(popular: [MovieResultResponseModel], topRated: [MovieResultResponseModel], nowPlaying: [MovieResultResponseModel], upcoming: [MovieResultResponseModel])
    func onGetMoviesForHomeAllFailed()
}

class HomePresenter
{
  weak var viewController: HomeDisplayLogic?
  
  
}

//MARK: -Presentation logic implementation

extension HomePresenter: HomePresentationLogic {
    
    func onGetMoviesForHomeSucceed(popular: [MovieResultResponseModel], topRated: [MovieResultResponseModel], nowPlaying: [MovieResultResponseModel],upcoming: [MovieResultResponseModel]) {
        
        //parse response models to collection cell models displayed inside of every category tableviewcell
        
        var categoryCells = [DrawerItemProtocol]()
        
        if !popular.isEmpty{
            let popularCells : [CollectionDrawerItemProtocol] = popular.map({MovieCollectionViewCellModel.init(movieResponseModel: $0)})
            categoryCells.append(MovieCategoryCellModel.init(title: HomeCategory.popular.title, elementsToDisplay: popularCells, additionalInfo: HomeCategory.popular))
        }
        
        if !topRated.isEmpty{
            let topRatedCells : [CollectionDrawerItemProtocol] = topRated.map({MovieCollectionViewCellModel.init(movieResponseModel: $0)})
            categoryCells.append(MovieCategoryCellModel.init(title: HomeCategory.topRated.title, elementsToDisplay: topRatedCells, additionalInfo: HomeCategory.topRated))
        }
        
        if !nowPlaying.isEmpty{
            let nowPlayingCells : [CollectionDrawerItemProtocol] = nowPlaying.map({MovieCollectionViewCellModel.init(movieResponseModel: $0)})
            categoryCells.append(MovieCategoryCellModel.init(title: HomeCategory.newReleases.title, elementsToDisplay: nowPlayingCells, additionalInfo: HomeCategory.newReleases))
        }
        
        if !upcoming.isEmpty{
            let upcomingCells : [CollectionDrawerItemProtocol] = upcoming.map({MovieCollectionViewCellModel.init(movieResponseModel: $0)})
            categoryCells.append(MovieCategoryCellModel.init(title: HomeCategory.upcoming.title, elementsToDisplay: upcomingCells, additionalInfo: HomeCategory.upcoming))
        }
        
        let viewModel = HomeViewModel.init(movieCategories: categoryCells)
        viewController?.loadCategoriesAndMovies(viewModel: viewModel)
    
    }
    
    
    func onGetMoviesForHomeAllFailed() {
        //insert an emptystate cell in the viewmodel so the viewcontroller will show it
        //we could use the same method as "loadCategoriesAndMovies" but i made another one so we could implement additional logic like showing an alert...
        let emptyStateViewModel = HomeViewModel.init(movieCategories: [EmptyStateCellModel.init(emptyState: EmptyState.home)])
        viewController?.onFetchingMoviesError(emptyStateViewModel: emptyStateViewModel)
    }

}
