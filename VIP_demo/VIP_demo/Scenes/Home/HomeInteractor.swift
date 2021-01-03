//
//  HomeInteractor.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 03/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

protocol HomeBusinessLogic
{
    func fetchMovies()
}

class HomeInteractor
{
  var presenter: HomePresentationLogic?
  var movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol = MovieService()){
        self.movieService = movieService
    }
  
}

//MARK: -Business logic implementation
extension HomeInteractor: HomeBusinessLogic {
    
    //MARK: -Fetch all the movies shown on the home screen concurrently. 
    
    func fetchMovies() {
        
        var popularMovies: [MovieResultResponseModel] = []
        var topRatedMovies: [MovieResultResponseModel] = []
        var nowPlayingMovies: [MovieResultResponseModel] = []
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        movieService.fetchPopularMovies { (popularMoviesResponseModel) in
            popularMovies = popularMoviesResponseModel.results ?? []
            dispatchGroup.leave()
        } failure: { (error, apiError) in
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        movieService.fetchTopRatedMovies { (topRatedMoviesResponseModel) in
            topRatedMovies = topRatedMoviesResponseModel.results ?? []
            dispatchGroup.leave()
        } failure: { (error, apiError) in
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        movieService.fetchNowPlayingMovies { (nowPlaying) in
            nowPlayingMovies = nowPlaying.results ?? []
            dispatchGroup.leave()
        } failure: { (error, apiError) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main){
            
            if popularMovies.isEmpty && topRatedMovies.isEmpty && nowPlayingMovies.isEmpty {
                self.presenter?.onGetMoviesForHomeAllFailed()
            } else {
                self.presenter?.onGetMoviesForHomeSucceed(popular: popularMovies, topRated: topRatedMovies, nowPlaying: nowPlayingMovies)
            }
        }
    }
    
    
}
