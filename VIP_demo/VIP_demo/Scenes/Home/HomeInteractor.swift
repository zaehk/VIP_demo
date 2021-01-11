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

protocol HomeDataStore
{
    var popularMovies: [MovieResultResponseModel] { get }
    var topRatedMovies: [MovieResultResponseModel] { get }
    var nowPlayingMovies: [MovieResultResponseModel] { get }
    var upcomingMovies: [MovieResultResponseModel] { get }
}

class HomeInteractor: HomeDataStore
{
    var presenter: HomePresentationLogic?
    var movieService: MovieServiceProtocol
    
    var popularMovies: [MovieResultResponseModel] = []
    var topRatedMovies: [MovieResultResponseModel] = []
    var nowPlayingMovies: [MovieResultResponseModel] = []
    var upcomingMovies: [MovieResultResponseModel] = []
    
    init(movieService: MovieServiceProtocol = MovieService()){
        self.movieService = movieService
    }
    
}

//MARK: -Business logic implementation
extension HomeInteractor: HomeBusinessLogic {
    
    //Fetch all the movies shown on the home screen concurrently.
    
    private func allMovieListsAreEmpty()->Bool{
        self.popularMovies.isEmpty && self.topRatedMovies.isEmpty && self.nowPlayingMovies.isEmpty && self.upcomingMovies.isEmpty
    }
    
    func fetchMovies() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        movieService.fetchPopularMovies { (popularMoviesResponseModel) in
            self.popularMovies = popularMoviesResponseModel.results ?? []
            dispatchGroup.leave()
        } failure: { (error, apiError) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        movieService.fetchTopRatedMovies { (topRatedMoviesResponseModel) in
            self.topRatedMovies = topRatedMoviesResponseModel.results ?? []
            dispatchGroup.leave()
        } failure: { (error, apiError) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        movieService.fetchNowPlayingMovies { (nowPlaying) in
            self.nowPlayingMovies = nowPlaying.results ?? []
            dispatchGroup.leave()
        } failure: { (error, apiError) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        movieService.fetchUpcomingMovies { (upcoming) in
            self.upcomingMovies = upcoming.results ?? []
            dispatchGroup.leave()
        } failure: { (error, apiError) in
            dispatchGroup.leave()
        }

        
        dispatchGroup.notify(queue: .main){
            
            self.presenter?.onGetMoviesForHomeAllFailed()
//
//            self.allMovieListsAreEmpty() ? self.presenter?.onGetMoviesForHomeAllFailed() : self.presenter?.onGetMoviesForHomeSucceed(popular: self.popularMovies, topRated: self.topRatedMovies, nowPlaying: self.nowPlayingMovies, upcoming: self.upcomingMovies)
//
        }
    }
    
    
}
