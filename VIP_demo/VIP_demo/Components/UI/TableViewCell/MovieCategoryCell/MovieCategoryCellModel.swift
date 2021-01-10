//
//   MovieCategoryViewModel.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit
internal final class MovieCategoryCellModel {
    
    var categoryTitle: String
    var elementsToShow: [CollectionDrawerItemProtocol]
    var additionalInfo: Any?
    var titleSize: CGFloat
    
    init(title: String, elementsToDisplay: [CollectionDrawerItemProtocol], additionalInfo: Any? = false, titleSize: CGFloat = 20){
        self.categoryTitle = title
        self.elementsToShow = elementsToDisplay
        self.additionalInfo = additionalInfo
        self.titleSize = titleSize
    }
    
}

// MARK: - DrawerItemProtocol -

extension MovieCategoryCellModel: DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol {
        return MovieCategoryDrawer()
    }
}
