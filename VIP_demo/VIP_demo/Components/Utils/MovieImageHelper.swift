//
//  MovieImageHelper.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.
//

import Foundation

class MovieImageHelper {
    
    
    static func getPosterUrl(size: MoviePosterSizes, with endpoint: String)-> String{
        return ApiEndpoints.BaseURL.postersBaseUrl + size.rawValue + endpoint
    }
    
    static func getBackdropUrl(size: BackdropSizes, with endpoint: String)-> String{
        return ApiEndpoints.BaseURL.postersBaseUrl + size.rawValue + endpoint
    }
    
    
}
