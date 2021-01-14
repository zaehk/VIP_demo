//
//  TableViewCellProtocols.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 03/01/2021.
//

import UIKit

protocol GetCellIdentifierProtocol {
    static func cellIdentifier() -> String
}

extension GetCellIdentifierProtocol where Self: UITableViewCell {
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}

internal protocol CellDrawerProtocol {
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any?, at indexPath: IndexPath?)
}

extension CellDrawerProtocol {
    func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath? = nil) {
        drawCell(cell, withItem: item, delegate: delegate, at: indexPath)
    }
}

internal protocol DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol { get }
}
