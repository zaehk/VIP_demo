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
    case popularMovies
    case movieDetail(movieId: Int)
    case nowPlayingMovies
    case topRatedMovies
    case upcomingMovies
    case movieCredits(movieId: Int)
    case movieReviews(movieId: Int)
}

extension ApiRouter: URLRequestConvertible {
    
    var method: HTTPMethod {
        switch self{
        
        case .popularMovies, .movieDetail, .nowPlayingMovies, .topRatedMovies, .upcomingMovies, .movieCredits, .movieReviews:
            return .get
        }
    }
    
    var path: String {
        switch self{
        case .popularMovies:
            return ApiEndpoints.MoviePath.popularMovies
        case .movieDetail(let movieId):
            return String(format: ApiEndpoints.MoviePath.movieDetail, String(movieId))
        case .nowPlayingMovies:
            return ApiEndpoints.MoviePath.nowPlayingMovies
        case .topRatedMovies:
            return ApiEndpoints.MoviePath.topRatedMovies
        case .upcomingMovies:
            return ApiEndpoints.MoviePath.upcomingMovies
        case .movieCredits(let movieId):
            return String(format: ApiEndpoints.MoviePath.movieCredits, String(movieId))
        case .movieReviews(let movieId):
        return String(format: ApiEndpoints.MoviePath.movieReviews, String(movieId))
        }
    }
    
    var parameters: Parameters? {
        //all the services we are going to use only need this parameter. If POST parameters would be needed we could do a switch and get the parameters or request model from the enum case and inject the apiKey using alamofire adapter.
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
