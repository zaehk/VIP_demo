//
//  HomePresenter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 03/01/2021.


import UIKit

protocol HomePresentationLogic
{
  func presentSomething(response: Home.Something.Response)
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Home.Something.Response)
  {
    let viewModel = Home.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
