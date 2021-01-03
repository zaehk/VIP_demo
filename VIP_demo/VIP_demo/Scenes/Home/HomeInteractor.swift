//
//  HomeInteractor.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 03/01/2021.


import UIKit

protocol HomeBusinessLogic
{
  func doSomething(request: Home.Something.Request)
}

protocol HomeDataStore
{
  //var name: String { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
  var presenter: HomePresentationLogic?
  var worker: HomeWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Home.Something.Request)
  {
    worker = HomeWorker()
    worker?.doSomeWork()
    
    let response = Home.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
