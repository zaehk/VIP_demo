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
        static let imagesBaseUrl = "https://image.tmdb.org/t/p/"
    }
    
    struct MoviePath{
        static let popularMovies = "movie/popular"
        static let nowPlayingMovies = "movie/now_playing"
        static let topRatedMovies = "movie/top_rated"
        static let upcomingMovies = "movie/upcoming"
        
        static let movieDetail = "movie/%@"
        static let movieCredits = "movie/%@/credits"
        static let movieReviews = "movie/%@/reviews"
    }
    
    struct CastingPath{
        static let castingImages = "person/%@/images"
        static let castDetail = "person/%@"
        static let moviesOfCast = "person/%@/movie_credits"
    }
    
}
