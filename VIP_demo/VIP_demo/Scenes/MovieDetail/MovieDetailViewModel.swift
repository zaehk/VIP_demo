//
//  MovieDetailModels.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.

import UIKit

class MovieDetailViewModel {
    
    var detailCells: [DrawerItemProtocol] = []
    var movieTitle: String
    
    init(movieTitle: String,movieDetailCells: [DrawerItemProtocol]){
        self.detailCells = movieDetailCells
        self.movieTitle = movieTitle
    }
    
}


class MovieCastMemberViewModel {
    
    var characterPlayed: String
    var name: String
    var imageUrl: String?
    
    init(castResponseModel: MovieCastMemberResponseModel){
        self.characterPlayed = castResponseModel.character ?? castResponseModel.job ?? ""
        self.name = castResponseModel.name ?? ""
        if let imageEndpoint = castResponseModel.profilePath {
            self.imageUrl = ProfilePictureSizes.medium.getFullUrlForSize(endpoint: imageEndpoint)
        }
    }
}

class MovieInfoViewModel {
    
    var title: String
    var detailImageUrl: String?
    var overview: String
    var productionCompanies: [String] = []
    var releaseDate: String
    var tagLine: String
    var voteAverage: String?
    
    
    init(movieDetailResponseModel: MovieDetailResponseModel){
        self.title = movieDetailResponseModel.title ?? ""
        if let backDropEndpoint = movieDetailResponseModel.backdropPath {
            self.detailImageUrl = BackdropImageSizes.medium.getFullUrlForSize(endpoint: backDropEndpoint)
        }
        self.overview = movieDetailResponseModel.overview ?? ""
        self.releaseDate = movieDetailResponseModel.releaseDate ?? ""
        if let vote = movieDetailResponseModel.voteAverage{
            self.voteAverage = String(vote)
        }
        self.tagLine = movieDetailResponseModel.tagline ?? ""
        if let companies = movieDetailResponseModel.productionCompanies {
            self.productionCompanies = companies.map({$0.name ?? ""})
        }
    }
}
