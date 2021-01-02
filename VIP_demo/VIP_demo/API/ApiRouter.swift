//
//  ApiRouter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import Foundation
import Alamofire

//enum to organize all the info needed to perform every call of the app

internal enum ApiRouter {
    case getPopularMovies
    case getMovieDetail(movieId: String)
}

extension ApiRouter: URLRequestConvertible {
    
    var method: HTTPMethod {
        switch self{
        
        case .getPopularMovies, .getMovieDetail:
            return .get
        }
    }
    
    var path: String {
        switch self{
        case .getPopularMovies:
            return ApiEndpoints.MoviePath.popularMovies
        case .getMovieDetail:
            return ApiEndpoints.MoviePath.movieDetail
        }
    }
    
    var parameters: Parameters? {
        //all the services we are going to use only need this parameter. If POST would be needed we could do a switch and get the parameters or request model from the enum case.
        return [ApiParameters.MovieDBApiKey.apiKey : ApiParameters.MovieDBApiKey.keyValue]
    }
    
    func asURLRequest() throws -> URLRequest {

        var urlRequest : URLRequest
        
        let url = try ApiEndpoints.BaseURL.moviesBaseUrl.asURL()
        
        //Create urlRequest
        urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Set method
        urlRequest.httpMethod = method.rawValue
        
        //Set parameters
        urlRequest = try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
        
        //Set max timeout time
        urlRequest.timeoutInterval = ApiParameters.requestTimeOut
                
        return urlRequest
    }
    
}
