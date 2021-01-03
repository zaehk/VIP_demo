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
    
    func fetchMovies() {
        movieService.fetchPopularMovies { (responseModel) in
            print("")
        } failure: { (error, apiError) in
            print("")
        }
        
        movieService.fetchDetailOfMovie(id: 464052) { (movieDetail) in
            print("")
        } failure: { (error, apiError) in
            print("")
        }


    }
    
    
    
}
