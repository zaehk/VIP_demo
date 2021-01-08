//
//  MovieWorker.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 03/01/2021.
//

import Foundation

protocol MovieServiceProtocol: ApiServiceProtocol{
    
    func fetchPopularMovies(success:@escaping(MovieListResponseModel)->(), failure: @escaping(FailureCompletion))
    func fetchDetailOfMovie(id: Int,success: @escaping (MovieDetailResponseModel) -> (), failure: @escaping (FailureCompletion))
    func fetchTopRatedMovies(success:@escaping(MovieListResponseModel)->(), failure: @escaping(FailureCompletion))
    func fetchNowPlayingMovies(success:@escaping(MoviesWithinDateRangeResponseModel)->(), failure: @escaping(FailureCompletion))
    func fetchUpcomingMovies(success: @escaping (MoviesWithinDateRangeResponseModel) -> (), failure: @escaping(FailureCompletion))
    
}

class MovieService: MovieServiceProtocol {
    
    
    let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol = ApiClient.shared) {
        self.apiClient = apiClient
    }
    
    func fetchPopularMovies(success: @escaping (MovieListResponseModel) -> (), failure: @escaping(FailureCompletion)) {
        apiClient.makeRequest(route: .popularMovies, responseModel: MovieListResponseModel.self, success: success, failed: failure)
    }
    
    func fetchDetailOfMovie(id: Int,success: @escaping (MovieDetailResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        apiClient.makeRequest(route: .movieDetail(movieId: id), responseModel: MovieDetailResponseModel.self, success: success, failed: failure)
    }
    
    func fetchTopRatedMovies(success: @escaping (MovieListResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        apiClient.makeRequest(route: .topRatedMovies, responseModel: MovieListResponseModel.self, success: success, failed: failure)
    }
    
    func fetchNowPlayingMovies(success: @escaping (MoviesWithinDateRangeResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        apiClient.makeRequest(route: .nowPlayingMovies, responseModel: MoviesWithinDateRangeResponseModel.self, success: success, failed: failure)
    }
    
    func fetchUpcomingMovies(success: @escaping (MoviesWithinDateRangeResponseModel) -> (), failure: @escaping(FailureCompletion)) {
        apiClient.makeRequest(route: .upcomingMovies, responseModel: MoviesWithinDateRangeResponseModel.self, success: success, failed: failure)
    }
    
    
    
}
