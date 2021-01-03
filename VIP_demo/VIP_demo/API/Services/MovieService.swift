//
//  MovieWorker.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 03/01/2021.
//

import Foundation

protocol MovieServiceProtocol: ApiServiceProtocol{
    
    func fetchPopularMovies(success:@escaping(PopularMovieListResponseModel)->(), failure: @escaping(FailureCompletion))
    func fetchDetailOfMovie(id: Int,success: @escaping (MovieDetailResponseModel) -> (), failure: @escaping (FailureCompletion))
    
}

class MovieService: MovieServiceProtocol {
    
    let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol = ApiClient.shared) {
        self.apiClient = apiClient
    }
    
    func fetchPopularMovies(success: @escaping (PopularMovieListResponseModel) -> (), failure: @escaping(FailureCompletion)) {
        apiClient.makeRequest(route: .getPopularMovies, responseModel: PopularMovieListResponseModel.self, success: success, failed: failure)
    }
    
    func fetchDetailOfMovie(id: Int,success: @escaping (MovieDetailResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        apiClient.makeRequest(route: .getMovieDetail(movieId: id), responseModel: MovieDetailResponseModel.self, success: success, failed: failure)
    }
    
    
}
