//
//   EmptyStateViewModel.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 11/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class EmptyStateCellModel {
    
    var emptyState: EmptyState
    
    init(emptyState: EmptyState){
        self.emptyState = emptyState
    }
    
}

// MARK: - DrawerItemProtocol -

extension EmptyStateCellModel: DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol {
        return EmptyStateDrawer()
    }
}
