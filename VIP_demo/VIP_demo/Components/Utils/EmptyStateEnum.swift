//
//  EmptyStateEnum.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 11/01/2021.
//

import UIKit

enum EmptyState {
    case home
    case detail
    case search
    
    var description: String{
        switch self{
        
        case .home:
            return Constants.EmptyState.descriptions.home
        case .detail:
            return Constants.EmptyState.descriptions.movieDetail
        case .search:
            return Constants.EmptyState.descriptions.search
        }
    }
    
    var emptyImage: UIImage? {
        switch self{
        case .home:
            return Constants.EmptyState.images.home
        case .detail:
            return Constants.EmptyState.images.detail
        case .search:
            return Constants.EmptyState.images.search
        }
    }
}
