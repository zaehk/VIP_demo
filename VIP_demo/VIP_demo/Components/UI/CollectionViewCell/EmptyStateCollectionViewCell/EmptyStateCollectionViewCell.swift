//
//   EmptyStateCollectionCell.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 12/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.
//

import UIKit

class EmptyStateCollectionViewCell: UICollectionViewCell, GetCollectionIdentifierProtocol {

        // MARK: - IBOutlets -
    
        // MARK: - Internal Methods -
    
    //example
//    func setTitleLabelText(text: String) {
//        titleLabel.text = text
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setEmptyStateImage(image: UIImage?){
        
    }
    
    func setEmptyStateDescription(description: String){
        
    }

}
