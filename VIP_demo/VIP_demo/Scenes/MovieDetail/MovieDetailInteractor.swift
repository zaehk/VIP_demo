//
//  MovieDetailInteractor.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.


import UIKit

protocol MovieDetailBusinessLogic
{

}

protocol MovieDetailDataStore
{
    var movieIdentifier: Int! {get set}
    //different response objects (movie detail, credits, trailers... etc)
}

class MovieDetailInteractor: MovieDetailBusinessLogic, MovieDetailDataStore
{
    
  var movieIdentifier: Int!
    
  var presenter: MovieDetailPresentationLogic?
  var movieService: MovieServiceProtocol?
  //var name: String = ""
  
  // MARK: Do something
  
//  func doSomething(request: MovieDetail.Something.Request)
//  {
//    worker = MovieDetailWorker()
//    worker?.doSomeWork()
//    
//    let response = MovieDetail.Something.Response()
//    presenter?.presentSomething(response: response)
//  }
}
