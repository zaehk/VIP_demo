//
//  ApiEndpoints.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 27/12/2020.
//

import Foundation

struct ApiEndpoints{
    
    struct BaseURL{
        static let moviesBaseUrl = "https://api.themoviedb.org/3/"
    }
    
    struct MoviePath{
        static let popularMovies = "movie/popular"
        static let movieDetail = "movie/%@"
        static let movieCasting = "movie/%@/credits"
    }
    
    struct CastingPath{
        static let castingImages = "person/%@/images"
        static let castDetail = "person/%@"
        static let moviesOfCast = "person/%@/movie_credits"
    }
    
}