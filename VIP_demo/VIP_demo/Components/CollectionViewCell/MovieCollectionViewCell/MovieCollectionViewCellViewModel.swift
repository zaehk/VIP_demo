//
//   MovieCollectionViewCellViewModel.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class MovieCollectionViewCellViewModel {
    // example
    //    var title: String
    //    var subtitle: String
    //    init(title: String,
    //         subtitle: String) {
    //        self.title = title
    //        self.subtitle = subtitle
    //    }
}

// MARK: - DrawerItemProtocol -

extension MovieCollectionViewCellViewModel: CollectionDrawerItemProtocol {
    var collectionDrawer: CollectionDrawerProtocol {
        return MovieCollectionViewCellDrawer()
    }
}
