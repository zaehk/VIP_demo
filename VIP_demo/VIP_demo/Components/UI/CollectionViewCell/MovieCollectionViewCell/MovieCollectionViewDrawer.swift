//
//   MovieCollectionViewDrawer.swift
//   VIP_demo
//
//   Creado por Borja Saez de Guinoa Vilaplana el 04/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class MovieCollectionViewDrawer: CollectionDrawerProtocol {
    
    func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.getCollectionIdentifier())
        return collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.getCollectionIdentifier(),
            for: indexPath)
    }
    
    func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any) {
        guard let cell = collectionView as? MovieCollectionViewCell, let cellVM = item as? MovieCollectionViewCellModel
        else {
            return
        }
        
        cell.setMovieTitle(title: cellVM.movieTitle)
        cell.setMoviePosterImage(url: cellVM.moviePosterUrl ?? "")
        
    }
}
