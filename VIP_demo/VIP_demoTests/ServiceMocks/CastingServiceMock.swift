//
//  CastingServiceMock.swift
//  VIP_demoTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/01/2021.
//

@testable import VIP_demo
import XCTest

class CastingServiceMock: CastingServiceProtocol{
    
    var apiClient: ApiClientProtocol
    var expectedFromCasting: ExpectedMockResponse
    var fetchMovieCreditsCalled = false
    
    init(expectedFromCasting: ExpectedMockResponse){
        self.expectedFromCasting = expectedFromCasting
        self.apiClient = MockApiClient()
    }
    
    func fetchMovieCredits(movieId: Int, success: @escaping (MovieCreditsResponseModel) -> (), failure: @escaping (FailureCompletion)) {
        ServiceResponseMock.getResponseForExpectedBehaviour(expected: expectedFromCasting, mockFile: MockFile.credits, success: success, failure: failure)
        
    }
    
}
