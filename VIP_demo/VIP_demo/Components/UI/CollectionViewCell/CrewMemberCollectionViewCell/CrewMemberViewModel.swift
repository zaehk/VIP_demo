//
//   CrewMemberViewModel.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 09/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class CrewMemberViewModel {
    
    var memberName: String
    var roleInMovie: String
    var imageUrl: String?
    
    init(name: String, role: String, imageUrl: String?){
        self.memberName = name
        self.roleInMovie = role
        self.imageUrl = imageUrl
    }
}

// MARK: - DrawerItemProtocol -

extension CrewMemberViewModel: CollectionDrawerItemProtocol {
    var collectionDrawer: CollectionDrawerProtocol {
        return CrewMemberDrawer()
    }
}
