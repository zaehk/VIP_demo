//
//  ApiErrorType.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import Foundation

internal enum APIErrorType: Error {
    case generalServiceError
    case badRequestError
    case unauthorisedError
    case serviceUnavailable
    case jsonParsingError
}

internal enum StatusCodes: Int {
    // MARK: - Client errors
    case Code400BadRequest = 400
    case Code401Unauthorised = 401
    case Code403Forbidden = 403
    case Code404NotFound = 404
    
    // MARK: - Server errors
    case Code500InternalServerError = 500
    case Code501NotImplemented = 501
    case Code502BadGateway = 502
    case Code503ServiceUnavailable = 503
    
    var code: Int {
        return rawValue
    }
    
    static func apiErrorType(_ statusCode: Int) -> APIErrorType {
        switch statusCode {
        case StatusCodes.Code400BadRequest.code:
            return APIErrorType.badRequestError
        case StatusCodes.Code401Unauthorised.code:
            return APIErrorType.unauthorisedError
        case StatusCodes.Code500InternalServerError.code:
            return APIErrorType.serviceUnavailable
        default:
            return APIErrorType.generalServiceError
        }
    }
}
