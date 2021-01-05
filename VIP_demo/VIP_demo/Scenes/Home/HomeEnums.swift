//
//  HomeEnums.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 04/01/2021.
//

import Foundation

enum MovieCategory {
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
