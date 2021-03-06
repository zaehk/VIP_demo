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
    func showEmptyStateView(emptyStateViewModel: HomeViewModel)
}

class HomeViewController: BaseViewController
{
    // MARK: VIP
    
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic)?
    
    // MARK: Variables

    private var movieCategories: [DrawerItemProtocol] = []
    private let refreshControl = UIRefreshControl()
    var categoryOfItemTapped: HomeCategory?
    var indexOfItemTapped: IndexPath?
    
    // MARK: Views
    
    let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.estimatedRowHeight = 200
        table.rowHeight = UITableView.automaticDimension
        table.allowsSelection = false
        table.backgroundColor = Constants.Styles.backGroundColor
        return table
    }()
    
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
        refreshControl.attributedTitle = NSAttributedString(string: Constants.TableViewRefreshControl.description)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
       getMoviesList()
    }
    
    private func getMoviesList(){
        showSpinner()
        interactor?.fetchMovies()
    }
    
    private func loadNewInfoInTable(viewModel: HomeViewModel){
        refreshControl.endRefreshing()
        self.movieCategories = viewModel.movieCategories
        tableView.reloadData()
    }
    
}

//MARK: -Display logic implementation

extension HomeViewController: HomeDisplayLogic {
    
    func showEmptyStateView(emptyStateViewModel: HomeViewModel) {
        hideSpinner()
        //we could show an alert... or additional logic besides overwriting the viewmodel with the empty state, better keep this method alongside the success method "loadCategoriesAndMovies"
        loadNewInfoInTable(viewModel: emptyStateViewModel)
    }
    
    func loadCategoriesAndMovies(viewModel: HomeViewModel) {
        hideSpinner()
        loadNewInfoInTable(viewModel: viewModel)
    }
    
}

//MARK: -TableView management

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movieCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = self.movieCategories[indexPath.row]
        let drawer = cellModel.cellDrawer
        let cell = drawer.dequeueCell(tableView, cellForRowAt: indexPath)
        drawer.drawCell(cell, withItem: cellModel, delegate: self, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //if its an emptyState cell it will cover the whole table
        if self.movieCategories[indexPath.row] is EmptyStateCellModel {
            return tableView.frame.height
        } else {
            return UITableView.automaticDimension
        }
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
