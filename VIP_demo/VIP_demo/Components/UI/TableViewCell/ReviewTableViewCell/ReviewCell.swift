//
//   ReviewCell.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 10/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

class ReviewCell: UITableViewCell, GetCellIdentifierProtocol {
    
    // MARK: - IBOutlets -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    // MARK: - Internal Methods -
    
//    func setTitleLabelText(text: String) {
//        titleLabel.text = text
//    }
    
}
