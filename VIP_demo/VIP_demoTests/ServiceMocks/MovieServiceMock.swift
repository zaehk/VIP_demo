//
//  MovieServiceMock.swift
//  VIP_demoTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/01/2021.
//

@testable import VIP_demo
import XCTest

enum ExpectedMockResponse {
    case error
    case emptyBodyArray
    case success
}

class MovieServiceMock: MovieServiceProtocol{
    
    var expectedFromPopular: ExpectedMockResponse
    var expectedFromDetail: ExpectedMockResponse
    var expectedFromTopRated: ExpectedMockResponse
    var expectedFromNewReleases: ExpectedMockResponse
    var expectedFromUpcoming: ExpectedMockResponse
    var expectedFromReviews: ExpectedMockResponse
    var expectedFromSearch: ExpectedMockResponse
    var apiClient: ApiClientProtocol

    
    
    init(popular: ExpectedMockResponse, detail: ExpectedMockResponse, topRated: ExpectedMockResponse, newReleases: ExpectedMockResponse, upcoming: ExpectedMockResponse, reviews: ExpectedMockResponse
                   , search: ExpectedMockResponse){
        self.expectedFromPopular = popular
        self.expectedFromDetail = detail
        self.expectedFromTopRated = topRated
        self.expectedFromNewReleases = newReleases
        self.expectedFromUpcoming = upcoming
        self.expectedFromReviews = reviews
        self.expectedFromSearch = search
        self.apiClient = MockApiClient()
    }
    
    func fetchPopularMovies(success: @escaping (MovieListResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        ServiceResponseMock.getResponseForExpectedBehaviour(expected: expectedFromPopular, mockFile: MockFile.movieList, success: success, failure: failure)
    }
    
    func fetchDetailOfMovie(id: Int, success: @escaping (MovieDetailResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        ServiceResponseMock.getResponseForExpectedBehaviour(expected: expectedFromDetail, mockFile: MockFile.movieDetail, success: success, failure: failure)
    }
    
    func fetchTopRatedMovies(success: @escaping (MovieListResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        ServiceResponseMock.getResponseForExpectedBehaviour(expected: expectedFromTopRated, mockFile: MockFile.movieList, success: success, failure: failure)
    }
    
    func fetchNowPlayingMovies(success: @escaping (MoviesWithinDateRangeResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        ServiceResponseMock.getResponseForExpectedBehaviour(expected: expectedFromNewReleases, mockFile: MockFile.movieList, success: success, failure: failure)
    }
    
    func fetchUpcomingMovies(success: @escaping (MoviesWithinDateRangeResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        ServiceResponseMock.getResponseForExpectedBehaviour(expected: expectedFromUpcoming, mockFile: MockFile.movieList, success: success, failure: failure)
    }
    
    func fetchMovieReviews(id: Int, success: @escaping (MovieReviewsResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        ServiceResponseMock.getResponseForExpectedBehaviour(expected: expectedFromReviews, mockFile: MockFile.movieList, success: success, failure: failure)
    }
    
    func searchMovie(query: String, success: @escaping (MovieListResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        ServiceResponseMock.getResponseForExpectedBehaviour(expected: expectedFromSearch, mockFile: MockFile.movieList, success: success, failure: failure)
    }
        
}


class MockApiClient: ApiClientProtocol {
    
    func makeRequest<T>(route: ApiRouter, responseModel: T.Type, success: @escaping (T) -> Void, failed: @escaping (Error, APIErrorType) -> Void) where T : Decodable {
        
    }
    
}
