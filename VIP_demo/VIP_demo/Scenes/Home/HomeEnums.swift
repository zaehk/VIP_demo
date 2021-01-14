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
            return Constants.HomeCategories.topRated
        case .upcoming:
            return Constants.HomeCategories.upcoming
        case .popular:
            return Constants.HomeCategories.popular
        case .newReleases:
            return Constants.HomeCategories.newReleases
        }
        
        
    }
}

