//
//  AlbumsOfArtistViewCell.swift
//  MusicBox
//
//  Created by Айнур on 26.08.2023.
//

import UIKit

class AlbumsOfArtistViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: -инициализация свойств
    var artistAlbums : [Album] = []
    
    enum Guidelines {
        static let ArtistAlbumsHeightItem : CGFloat = 140
        static let ArtistAlbumsWidthItem : CGFloat = 140
    }
    
    let mainContainer = UIView()
    let artistAlbumsTitleLabel = UILabel()
    
    
    //MARK: -инициализация Коллекции
    private var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        layout.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //MARK: - инициализация
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //MARK: - Контейнер
        mainContainer.backgroundColor = UIColor(red: 223/256, green: 219/256, blue: 219/256, alpha: 1)
        contentView.addSubview(mainContainer)
        
        mainContainer.snp.makeConstraints { make in            make.edges.equalToSuperview()
        }
        //MARK: - Раздел с альбомами
        artistAlbumsTitleLabel.text = "Альбомы"
        artistAlbumsTitleLabel.font = UIFont.systemFont(ofSize: 15)
        mainContainer.addSubview(artistAlbumsTitleLabel)
        
        artistAlbumsTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(15)
            make.bottom.lessThanOrEqualToSuperview()
        }
        //MARK: - Коллекция
        collectionView.register(ArtistAlbumsCollectionViewCell.self, forCellWithReuseIdentifier: ArtistAlbumsCollectionViewCell.identifier)
        setupCollectionView()
        mainContainer.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(red: 223/256, green: 219/256, blue: 219/256, alpha: 1)
    
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(artistAlbumsTitleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(160)
            make.bottom.lessThanOrEqualToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - методы коллекции
    internal func setupCollectionView () {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistAlbums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
                collectionView.dequeueReusableCell(withReuseIdentifier: ArtistAlbumsCollectionViewCell.identifier, for: indexPath) as? ArtistAlbumsCollectionViewCell else { return UICollectionViewCell() }
        let album = artistAlbums [indexPath.row]
        cell.configure( with : album)
        return cell
    }
}

extension AlbumsOfArtistViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Guidelines.ArtistAlbumsWidthItem, height: Guidelines.ArtistAlbumsWidthItem)
    }
}
