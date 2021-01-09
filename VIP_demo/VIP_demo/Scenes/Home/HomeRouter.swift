//
//  HomeRouter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 03/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

//


import UIKit

@objc protocol HomeRoutingLogic
{
    func routeToMovieDetail()
}

protocol HomeDataPassing
{
  var dataStore: HomeDataStore? { get }
    
    func passDataToMovieDetail(source: HomeDataStore, destination: inout MovieDetailDataStore)
}

class HomeRouter: NSObject
{
  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?

}

//MARK: -Routing logic implementation

extension HomeRouter: HomeRoutingLogic {
    
    func routeToMovieDetail() {
        let movieDetailVC = MovieDetailViewController()
        if var movieDetailDS = movieDetailVC.router?.dataStore, let homeDataStore = dataStore {
            passDataToMovieDetail(source: homeDataStore, destination: &movieDetailDS)
        }
        viewController?.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
}

//MARK: -Data passing logic implementation

extension HomeRouter: HomeDataPassing {
    
    func passDataToMovieDetail(source: HomeDataStore, destination: inout MovieDetailDataStore) {
        if let categoryTapped = viewController?.categoryOfItemTapped, let index = viewController?.indexOfItemTapped {
            
            switch categoryTapped {
            
            case .topRated:
                destination.movieIdentifier = source.topRatedMovies[index.row].id ?? 0
            case .upcoming:
                destination.movieIdentifier = source.upcomingMovies[index.row].id ?? 0
            case .popular:
                destination.movieIdentifier = source.popularMovies[index.row].id ?? 0
            case .newReleases:
                destination.movieIdentifier = source.nowPlayingMovies[index.row].id ?? 0
            }
        }
    }
    
}
