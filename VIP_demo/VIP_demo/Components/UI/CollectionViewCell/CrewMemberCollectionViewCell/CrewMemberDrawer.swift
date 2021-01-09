//
//   CrewMemberDrawer.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 09/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class CrewMemberDrawer: CollectionDrawerProtocol {
    
    func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(CrewMemberCell.self, forCellWithReuseIdentifier: CrewMemberCell.getCollectionIdentifier())
        return collectionView.dequeueReusableCell(withReuseIdentifier: CrewMemberCell.getCollectionIdentifier(),
            for: indexPath)
    }
    
    func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any) {
        guard let cell = collectionView as? CrewMemberCell, let cellVM = item as? CrewMemberViewModel
        else {
            return
        }
        
        cell.setMemberName(name: cellVM.memberName)
        cell.setMemberRole(role: cellVM.roleInMovie)
        
        if let imageURL = cellVM.imageUrl {
            cell.setMemberImage(url: imageURL)
        }
    }
}
