//
//   MovieCollectionViewViewModel.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class MovieCollectionViewCellModel {
    
    
    init(movieResponseModel: MovieResultResponseModel){
        
    }
}

// MARK: - DrawerItemProtocol -

extension MovieCollectionViewCellModel: CollectionDrawerItemProtocol {
    var collectionDrawer: CollectionDrawerProtocol {
        return MovieCollectionViewDrawer()
    }
}
