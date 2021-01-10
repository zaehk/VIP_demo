//
//  MovieDetailEnums.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 10/01/2021.
//

import Foundation

enum MovieDetailCategories {
    
    case actors
    case crew
    case reviews
    
    var title: String {
        switch self{
        
        case .actors:
            return Constants.MovieDetailCategories.actors
        case .crew:
            return Constants.MovieDetailCategories.crew
        case .reviews:
            return Constants.MovieDetailCategories.reviews
        }
    }
}
