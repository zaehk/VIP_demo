//
//  HomeViewController.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 03/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit
import SnapKit

protocol HomeDisplayLogic: class, BaseViewDisplayLogic
{
    func loadCategoriesAndMovies(viewModel: HomeViewModel)
}

class HomeViewController: BaseViewController
{
    // MARK: VIP
    
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic)?
    
    // MARK: Variables

    var viewModel: HomeViewModel = HomeViewModel(movieCategories: [])
    
    var categoryOfItemTapped: HomeCategory?
    var indexOfItemTapped: IndexPath?
    
    // MARK: Views
    
    var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.estimatedRowHeight = 200
        table.rowHeight = UITableView.automaticDimension
        table.allowsSelection = false
        table.backgroundColor = .black
        return table
    }()
    
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
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupViews()
        setupTableView()
        getMoviesList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupViews(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getMoviesList(){
        //showSpinner
        interactor?.fetchMovies()
    }
    
}

//MARK: -Display logic implementation

extension HomeViewController: HomeDisplayLogic {
    
    func loadCategoriesAndMovies(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
}

//MARK: -TableView management

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movieCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = viewModel.movieCategories[indexPath.row]
        let drawer = cellModel.cellDrawer
        let cell = drawer.dequeueCell(tableView, cellForRowAt: indexPath)
        drawer.drawCell(cell, withItem: cellModel, delegate: self, at: indexPath)
        return cell
    }
}

//MARK: -MovieCategoryTap protocol implementation

extension HomeViewController: MovieCategoryTapProtocol{
    
    func userDidSelectedElement(indexSelected: IndexPath, additionalInfo: Any?) {
        if let homeCategorySelected = additionalInfo as? HomeCategory{
            self.categoryOfItemTapped = homeCategorySelected
            self.indexOfItemTapped = indexSelected
            router?.routeToMovieDetail()
        }
    }
    
}
