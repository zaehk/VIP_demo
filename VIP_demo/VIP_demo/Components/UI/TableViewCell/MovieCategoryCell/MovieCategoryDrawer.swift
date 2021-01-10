//
//   MovieCategoryDrawer.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class MovieCategoryDrawer: CellDrawerProtocol {
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(MovieCategoryCell.self, forCellReuseIdentifier: MovieCategoryCell.cellIdentifier())
        
        return tableView.dequeueReusableCell(withIdentifier: MovieCategoryCell.cellIdentifier(), for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath? = nil) {
        guard let cell = cell as? MovieCategoryCell, let cellVM = item as? MovieCategoryCellModel else {
            return
        }
        
        cell.setCategoryTitleLabelText(text: cellVM.categoryTitle)
        cell.setCollectionElementsToShow(cells: cellVM.elementsToShow)
        
        if let delegate = delegate as? MovieCategoryTapProtocol{
            cell.setTapDelegate(delegate: delegate)
        }
        
        cell.setCategoryIdentifier(additionalInfo: cellVM.additionalInfo)
        cell.setTitleTextSize(size: cellVM.titleSize)
    }
}

