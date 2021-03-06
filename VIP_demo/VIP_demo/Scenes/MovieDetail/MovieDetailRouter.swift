//
//  MovieDetailRouter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.

import UIKit

@objc protocol MovieDetailRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol MovieDetailDataPassing
{
  var dataStore: MovieDetailDataStore? { get }
}

class MovieDetailRouter: NSObject, MovieDetailRoutingLogic, MovieDetailDataPassing
{
  weak var viewController: MovieDetailViewController?
  var dataStore: MovieDetailDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: MovieDetailViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: MovieDetailDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
