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
    var movieDetail: MovieDetailResponseModel? {get}
    
}

class MovieDetailInteractor: MovieDetailDataStore
{
    var movieIdentifier: Int!
    
    //primary info
    var movieDetail: MovieDetailResponseModel?
    
    //additional info
    var castingMembers: [MovieCastMemberResponseModel] = []
    var crewMembers: [MovieCastMemberResponseModel] = []
    var movieReviews: [ReviewResultResponseModel] = []
    
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
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        movieService.fetchDetailOfMovie(id: self.movieIdentifier) { (movieDetailResponseModel) in
            self.movieDetail = movieDetailResponseModel
            dispatchGroup.leave()
        } failure: { (error, apiError) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        castingService.fetchMovieCredits(movieId: self.movieIdentifier) { (creditsResponseModel) in
            if let crew = creditsResponseModel.crew, let cast = creditsResponseModel.cast {
                
                //adding first 20 actors
                self.castingMembers = Array(cast.filter({$0.profilePath != nil}).prefix(20))
                
                //adding directors
                self.crewMembers = self.getCastOrCrewByDepartment(people: crew, department: .directing, maxNumberOfResults: 5)
                
                //adding writers
                self.crewMembers.append(contentsOf: self.getCastOrCrewByDepartment(people: crew, department: .writing, maxNumberOfResults: 5))
                
                //adding producers
                self.crewMembers.append(contentsOf: self.getCastOrCrewByDepartment(people: crew, department: .production, maxNumberOfResults: 5))
            }
            dispatchGroup.leave()
        } failure: { (error, apiError) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        movieService.fetchMovieReviews(id: movieIdentifier) { (reviewsResponseModel) in
            if let reviews = reviewsResponseModel.results{
                self.movieReviews = reviews
            }
            dispatchGroup.leave()
        } failure: { (error, apiError) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            
            if let safeDetail = self.movieDetail {
                //if movie details succeed we show that, the rest of the additional info like casting or crew is expendable
                self.presenter?.presentMovieInfo(movieDetail: safeDetail, casting: self.castingMembers, crew: self.crewMembers, reviews: self.movieReviews)
            }else {
                //if the movie detail fails (after 3 retries of alamofire retrier) an empty state will be shown
                self.presenter?.onGetMovieDetailFailed()
            }
        }
        
    }
    
    //get only intertesting crew members like director, writers and producers
    private func getCastOrCrewByDepartment(people: [MovieCastMemberResponseModel], department: CastMemberDepartment, maxNumberOfResults: Int)-> [MovieCastMemberResponseModel]{
        let filteredResults = people.filter({
            if let role = $0.department, $0.profilePath != nil {
                return role == department
            } else {
                return false
            }
        })
        return Array(filteredResults.prefix(maxNumberOfResults))
    }
    
}
