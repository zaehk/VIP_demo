//
//  CastingService.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 09/01/2021.
//

import Foundation

protocol CastingServiceProtocol: ApiServiceProtocol {
    
    func fetchMovieCredits(movieId: Int,success: @escaping (MovieCreditsResponseModel) -> (), failure: @escaping (FailureCompletion))

}

class CastingService: CastingServiceProtocol {
    
    let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol = ApiClient.shared) {
        self.apiClient = apiClient
    }
    
    func fetchMovieCredits(movieId: Int, success: @escaping (MovieCreditsResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        apiClient.makeRequest(route: ApiRouter.movieCredits(movieId: movieId), responseModel: MovieCreditsResponseModel.self, success: success, failed: failure)
    }
    
}
