//
//  HomeEnums.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 04/01/2021.
//

import Foundation

enum HomeCategory {
    case topRated
    case upcoming
    case popular
    case newReleases
    
    var title: String {
        switch self {
        
        case .topRated:
            return Constants.MovieCategories.topRated
        case .upcoming:
            return Constants.MovieCategories.upcoming
        case .popular:
            return Constants.MovieCategories.popular
        case .newReleases:
            return Constants.MovieCategories.newReleases
        }
        
        
    }
}

enum MoviePosterSizes: String {
  case small = "w92"
  case medium = "w342"
  case big = "w500"
}

enum BackdropSizes: String {
    case small = "w300"
    case medium = "w780"
    case big = "w1280"
}
