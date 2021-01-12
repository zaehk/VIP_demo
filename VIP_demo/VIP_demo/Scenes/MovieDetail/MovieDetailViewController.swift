//
//  MovieDetailViewController.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 06/01/2021.


import UIKit

protocol MovieDetailDisplayLogic: class, BaseViewDisplayLogic
{
    func displayMovieInfo(viewModel: MovieDetailViewModel)
    func displayErrorFetchingMovieDetail(emptyStateCell: DrawerItemProtocol)
}

class MovieDetailViewController: BaseViewController
{
    
    var interactor: MovieDetailBusinessLogic?
    var router: (NSObjectProtocol & MovieDetailRoutingLogic & MovieDetailDataPassing)?
    
    private var detailCells: [DrawerItemProtocol] = []
    
    private let tableView: UITableView = {
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
        getMovieDetailInfo()
    }
    
    private func setupViews(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getMovieDetailInfo(){
        showSpinner()
        interactor?.fetchMovieDetail()
    }
    
    private func loadCellsInTableView(newCells: [DrawerItemProtocol]){
        self.detailCells = newCells
        self.tableView.reloadData()
    }
    
}

extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        detailCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = detailCells[indexPath.row]
        let drawer = cellModel.cellDrawer
        let cell = drawer.dequeueCell(tableView, cellForRowAt: indexPath)
        drawer.drawCell(cell, withItem: cellModel, delegate: self, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if detailCells[indexPath.row] is EmptyStateCellModel {
            return tableView.frame.height
        } else {
            return UITableView.automaticDimension
        }
    }
}

extension MovieDetailViewController: MovieDetailDisplayLogic {
    
    func displayMovieInfo(viewModel: MovieDetailViewModel) {
        hideSpinner()
        self.title = viewModel.movieInfoVM.title
        loadCellsInTableView(newCells: viewModel.detailCells)
    }
    
    func displayErrorFetchingMovieDetail(emptyStateCell: DrawerItemProtocol){
        hideSpinner()
        loadCellsInTableView(newCells: [emptyStateCell])
    }
    
}

