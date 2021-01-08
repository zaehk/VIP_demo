//
//  MovieCategoryTapProtocol.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 07/01/2021.
//

import Foundation

protocol MovieCategoryTapProtocol: NSObject{
    func userDidSelectedElement(indexSelected: IndexPath, additionalInfo: Any?)
}
