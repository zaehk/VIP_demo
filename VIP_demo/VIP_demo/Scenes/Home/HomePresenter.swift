//
//  HomePresenter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 03/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

protocol HomePresentationLogic
{
    func onGetMoviesForHomeSucceed(popular: [MovieResultResponseModel], topRated: [MovieResultResponseModel], nowPlaying: [MovieResultResponseModel])
    func onGetMoviesForHomeAllFailed()
}

class HomePresenter
{
  weak var viewController: HomeDisplayLogic?
  
  
}

//MARK: -Presentation logic implementation

extension HomePresenter: HomePresentationLogic {
    
    func onGetMoviesForHomeSucceed(popular: [MovieResultResponseModel], topRated: [MovieResultResponseModel], nowPlaying: [MovieResultResponseModel]) {
        
        var moviesCategoriesCells: [DrawerItemProtocol] = []
        
        
        
        
    }
    
    func onGetMoviesForHomeAllFailed() {
        
        
        
        
    }
    
    
    

}
