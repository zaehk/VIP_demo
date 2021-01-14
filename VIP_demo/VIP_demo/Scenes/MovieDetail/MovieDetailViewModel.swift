//
//  MovieDetailModels.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.

import UIKit

class MovieDetailViewModel {
    
    var detailCells: [DrawerItemProtocol] = []
    var movieInfoVM: MovieInfoViewModel
    
    init(movieInfoVM: MovieInfoViewModel,movieDetailCells: [DrawerItemProtocol]){
        self.detailCells = movieDetailCells
        self.movieInfoVM = movieInfoVM
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
    
    init(title: String, detailImgUrl: String?, overview: String, productionCompanies: [String], releaseDate: String, tagLine: String, voteAverage: String?){
        self.title = title
        self.detailImageUrl = detailImgUrl
        self.overview = overview
        self.productionCompanies = productionCompanies
        self.releaseDate = releaseDate
        self.tagLine = tagLine
        self.voteAverage = voteAverage
    }
    
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

class MovieReviewViewModel {
     
    var review: String
    var author: String
    var rating: String?
    var date: String
    
    init(movieReviewResponseModel: ReviewResultResponseModel){
        self.review = movieReviewResponseModel.content ?? ""
        self.author = movieReviewResponseModel.author ?? "Unknown"
        if let vote = movieReviewResponseModel.authorDetails?.rating{
            self.rating = "\(vote)/10"
        }
        self.date = movieReviewResponseModel.createdAt ?? ""
    }
}
