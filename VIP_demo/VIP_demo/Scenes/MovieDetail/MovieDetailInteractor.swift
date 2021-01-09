//
//  MovieDetailInteractor.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.


import UIKit

protocol MovieDetailBusinessLogic
{
    func fetchMovieDetail()
}

protocol MovieDetailDataStore
{
    var movieIdentifier: Int! {get set}
    //different response objects (movie detail, credits, trailers... etc)
    
    //data fetched from api (ACTORES, PRODUCTION COMPANIES,
}

class MovieDetailInteractor: MovieDetailDataStore
{
  var movieIdentifier: Int!
    
  var presenter: MovieDetailPresentationLogic?
  var movieService: MovieServiceProtocol
    var castingService: CastingServiceProtocol
    
    init(movieService: MovieServiceProtocol = MovieService(), castingService: CastingServiceProtocol = CastingService()){
        self.movieService = movieService
        self.castingService = castingService
    }
    
}

extension MovieDetailInteractor: MovieDetailBusinessLogic{
    
    func fetchMovieDetail() {
        movieService.fetchDetailOfMovie(id: self.movieIdentifier) { (movieDetailResponseModel) in
            print("")
        } failure: { (error, apiError) in
            print("")
        }
        
        castingService.fetchMovieCredits(movieId: self.movieIdentifier) { (creditsResponseModel) in
            print("")
        } failure: { (error, apiError) in
            print("")
        }


    }
    
}
