//
//   MovieCollectionViewCellDrawer.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class MovieCollectionViewCellDrawer: CollectionDrawerProtocol {
    
    func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: MovieCollectionViewCellCell.getCollectionIdentifier(),
            bundle: nil),
                                forCellWithReuseIdentifier: MovieCollectionViewCellCell.getCollectionIdentifier())
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCellCell.getCollectionIdentifier(),
            for: indexPath)
    }
    
    func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any) {
        guard let cell = collectionView as? MovieCollectionViewCellCell, let cellVM = item as? MovieCollectionViewCellViewModel
        else {
            return
        }
        
    }
}
