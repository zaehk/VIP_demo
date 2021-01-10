//
//   ReviewViewModel.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 10/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class ReviewCellModel {
    
}

// MARK: - DrawerItemProtocol -

extension ReviewCellModel: DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol {
        return ReviewDrawer()
    }
}
