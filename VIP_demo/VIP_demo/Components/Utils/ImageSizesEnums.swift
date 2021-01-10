//
//  MovieImageHelper.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.
//

import Foundation

protocol PictureSizeProtocol {
    var sizeUrlString: String {get}
    func getFullUrlForSize(endpoint: String)->String
}

extension PictureSizeProtocol {
    func getFullUrlForSize(endpoint: String)->String{
        return ApiEndpoints.BaseURL.imagesBaseUrl + sizeUrlString + endpoint
    }
}

enum MoviePosterSizes: PictureSizeProtocol {
    
    case small
    case medium
    case big
    
    var sizeUrlString: String {
        switch self{
        case .small:
            return "w92"
        case .medium:
            return "w342"
        case .big:
            return "w500"
        }
    }
    
}

enum BackdropImageSizes: PictureSizeProtocol{
    
    case small
    case medium
    case big
    
    var sizeUrlString: String {
        switch self{
        case .small:
            return "w300"
        case .medium:
            return "w780"
        case .big:
            return "w1280"
        }
    }
    
}

enum ProfilePictureSizes: PictureSizeProtocol {
    case small
    case medium
    case big
    case original
    
    var sizeUrlString: String {
        switch self {
        
        case .small:
            return "w45"
        case .medium:
            return "w185"
        case .big:
            return "h632"
        case .original:
            return "original"
        }
    }
    
}
