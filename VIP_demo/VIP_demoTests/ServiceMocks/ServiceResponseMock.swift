//
//  ServiceResponseMock.swift
//  VIP_demoTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/01/2021.
//

@testable import VIP_demo
import XCTest

class ServiceResponseMock {
    
    static func getResponseForExpectedBehaviour<T: Decodable>(expected: ExpectedMockResponse, mockFile: MockFileConstant, success: @escaping(T)->(), failure: @escaping(FailureCompletion)){
        switch expected {
        case .error:
            failure(APIErrorType.badRequestError, APIErrorType.badRequestError)
        case .emptyBodyArray:
            success(JSONMockDecoder.decode(mock: mockFile.errorOrEmpty))
        case .success:
            success(JSONMockDecoder.decode(mock: mockFile.success))
        }
    }
    
}
