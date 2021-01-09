//
//  MovieDetailModels.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.

import UIKit

class MovieDetailViewModel {
    
    var detailCells: [DrawerItemProtocol] = []
    
    init(){
        
    }
    
    
}


class MovieCastMemberViewModel {
    
    var characterPlayed: String
    var name: String
    var imageUrl: String?
    
    init(castResponseModel: MovieCastMemberResponseModel){
        self.characterPlayed = castResponseModel.character ?? ""
        self.name = castResponseModel.name ?? ""
        if let imageEndpoint = castResponseModel.profilePath {
            self.imageUrl = ProfilePictureSizes.medium.getFullUrlForSize(endpoint: imageEndpoint)
        }
    }
}
