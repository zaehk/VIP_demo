//
//   MovieDetailInfoViewModel.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 10/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class MovieDetailInfoCellModel {
    
    var overView: String
    var vote: String?
    var imageURL: String?
    var companies: [String]
    
    init(movieInfoVM: MovieInfoViewModel){
        self.imageURL = movieInfoVM.detailImageUrl
        self.overView = movieInfoVM.overview
        self.vote = movieInfoVM.voteAverage
        self.companies = movieInfoVM.productionCompanies
    }
}

// MARK: - DrawerItemProtocol -

extension MovieDetailInfoCellModel: DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol {
        return MovieDetailInfoDrawer()
    }
}
