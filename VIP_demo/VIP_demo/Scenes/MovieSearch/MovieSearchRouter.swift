//
//  MovieSearchRouter.swift
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

@objc protocol MovieSearchRoutingLogic
{
    func routeToMovieDetail()
}

protocol MovieSearchDataPassing
{
    var dataStore: MovieSearchDataStore? { get }
    
    func passDataToMovieDetail(source: MovieSearchDataStore, destination: inout MovieDetailDataStore)
}

class MovieSearchRouter: NSObject, MovieSearchRoutingLogic, MovieSearchDataPassing
{
    
    weak var viewController: MovieSearchViewController?
    var dataStore: MovieSearchDataStore?
    
    func routeToMovieDetail() {
        let movieDetailVC = MovieDetailViewController()
        if var movieDetailDS = movieDetailVC.router?.dataStore, let searchDataStore = dataStore {
            passDataToMovieDetail(source: searchDataStore, destination: &movieDetailDS)
        }
        viewController?.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    func passDataToMovieDetail(source: MovieSearchDataStore, destination: inout MovieDetailDataStore) {
        let index = viewController?.resultsCollectionView.indexPathsForSelectedItems?.first?.row ?? 0
        destination.movieIdentifier = source.matchingMovies[index].id
    }
    
}
