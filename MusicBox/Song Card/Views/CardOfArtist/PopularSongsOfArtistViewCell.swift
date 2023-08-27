//
//  PopularSongsOfArtist.swift
//  MusicBox
//
//  Created by Айнур on 26.08.2023.
//

import UIKit

class PopularSongsOfArtistViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    // создаем экземпляр  песен артиста
    var artistSongs : [Song] = []
    
    private var collectionView : UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PopularSongsCollectionViewCell.self, forCellWithReuseIdentifier: PopularSongsOfArtistViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }
    
    
    internal func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
