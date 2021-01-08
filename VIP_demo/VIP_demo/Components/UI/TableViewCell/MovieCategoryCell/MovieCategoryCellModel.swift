//
//   MovieCategoryViewModel.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class MovieCategoryCellModel {
    
    var categoryTitle: String
    var elementsToShow: [CollectionDrawerItemProtocol]
    var additionalInfo: Any?
    
    init(title: String, elementsToDisplay: [CollectionDrawerItemProtocol], additionalInfo: Any? = false){
        self.categoryTitle = title
        self.elementsToShow = elementsToDisplay
        self.additionalInfo = additionalInfo
    }
    
}

// MARK: - DrawerItemProtocol -

extension MovieCategoryCellModel: DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol {
        return MovieCategoryDrawer()
    }
}
