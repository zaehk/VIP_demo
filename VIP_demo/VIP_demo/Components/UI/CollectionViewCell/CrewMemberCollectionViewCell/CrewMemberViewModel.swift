//
//   CrewMemberViewModel.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 09/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class CrewMemberCellModel {
    
    var memberName: String
    var roleInMovie: String
    var imageUrl: String?
    
    init(castVM: MovieCastMemberViewModel){
        self.memberName = castVM.name
        self.roleInMovie = castVM.characterPlayed
        self.imageUrl = castVM.imageUrl
    }
    
}

// MARK: - DrawerItemProtocol -

extension CrewMemberCellModel: CollectionDrawerItemProtocol {
    var collectionDrawer: CollectionDrawerProtocol {
        return CrewMemberDrawer()
    }
}
