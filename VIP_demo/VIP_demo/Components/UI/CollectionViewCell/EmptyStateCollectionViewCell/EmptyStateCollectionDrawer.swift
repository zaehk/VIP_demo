//
//   EmptyStateCollectionDrawer.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 12/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class EmptyStateCollectionDrawer: CollectionDrawerProtocol {
    
    func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(EmptyStateCollectionViewCell.self, forCellWithReuseIdentifier: EmptyStateCollectionViewCell.getCollectionIdentifier())
        return collectionView.dequeueReusableCell(withReuseIdentifier: EmptyStateCollectionViewCell.getCollectionIdentifier(),
            for: indexPath)
    }
    
    func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any) {
        guard let cell = collectionView as? EmptyStateCollectionViewCell, let cellVM = item as? EmptyStateCollectionCellModel
        else {
            return
        }
        cell.setEmptyStateImage(image: cellVM.emptyState.emptyImage)
        cell.setEmptyStateDescription(description: cellVM.emptyState.description)
    }
}
