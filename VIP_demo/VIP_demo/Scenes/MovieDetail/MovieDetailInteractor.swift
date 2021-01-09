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
    
    var castingMembers: [MovieCastMemberResponseModel] {get}
    var movieReviews: [ReviewResultResponseModel] {get}

}

class MovieDetailInteractor: MovieDetailDataStore
{
    var castingMembers: [MovieCastMemberResponseModel] = []
    var movieReviews: [ReviewResultResponseModel] = []
    
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
            if let casting = creditsResponseModel.cast {
                self.castingMembers = casting
            }
            
        } failure: { (error, apiError) in
            print("")
        }
        
        movieService.fetchMovieReviews(id: movieIdentifier) { (reviewsResponseModel) in
            if let reviews = reviewsResponseModel.results{
                self.movieReviews = reviews
            }
        } failure: { (error, apiError) in
            print("")
        }
        
        
        
    }
    
}
