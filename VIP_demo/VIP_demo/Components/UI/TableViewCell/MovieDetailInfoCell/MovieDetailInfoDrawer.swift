//
//   MovieDetailInfoDrawer.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 10/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class MovieDetailInfoDrawer: CellDrawerProtocol {
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: MovieDetailInfoCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: MovieDetailInfoCell.cellIdentifier())
        
        return tableView.dequeueReusableCell(withIdentifier: MovieDetailInfoCell.cellIdentifier(), for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath? = nil) {
        guard let cell = cell as? MovieDetailInfoCell, let cellVM = item as? MovieDetailInfoCellModel else {
            return
        }
        //example
       // cell.setTitleLabelText(text: cellVM.title)
   
    }
}
