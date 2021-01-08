//
//  MovieDetailViewController.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.


import UIKit

protocol MovieDetailDisplayLogic: class, BaseViewDisplayLogic
{
  func displayMovieInfo(viewModel: MovieDetailViewModel)
}

class MovieDetailViewController: BaseViewController
{
  var interactor: MovieDetailBusinessLogic?
  var router: (NSObjectProtocol & MovieDetailRoutingLogic & MovieDetailDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = MovieDetailInteractor()
    let presenter = MovieDetailPresenter()
    let router = MovieDetailRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    setupViews()
  }
    
  private func setupViews(){
//        self.view.addSubview(tableView)
//        tableView.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view.safeAreaLayoutGuide)
//        }
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
  
}

extension MovieDetailViewController: MovieDetailDisplayLogic {
    
    func displayMovieInfo(viewModel: MovieDetailViewModel) {
        
    }
    
}
