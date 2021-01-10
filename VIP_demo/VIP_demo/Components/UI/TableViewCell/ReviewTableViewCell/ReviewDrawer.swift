//
//   ReviewDrawer.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 10/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class ReviewDrawer: CellDrawerProtocol {
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(ReviewCell.self, forCellReuseIdentifier: ReviewCell.cellIdentifier())
        return tableView.dequeueReusableCell(withIdentifier: MovieDetailInfoCell.cellIdentifier(), for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath? = nil) {
        guard let cell = cell as? ReviewCell, let cellVM = item as? ReviewCellModel else {
            return
        }
        
   
    }
}

