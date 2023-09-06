//
//  PopularSongsOfArtist.swift
//  MusicBox
//
//  Created by Айнур on 26.08.2023.
//

import UIKit

class PopularSongsOfArtistViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    //MARK: -инициализация свойств
    // экземпляр  песен артиста
    var artistSongs : [Song] = []
   
    enum Guidelines {
        static let PopularSongsHeightItem : CGFloat = 60
        static let PopularSongsWidthItem : CGFloat = 170
    }
    //  контейнер для коллекции и тайтл
    let mainContainer = UIView()
    let popularTitleLabel = UILabel()
    var allSongsOfArtistButton = UIButton()
    
  
    
    //MARK: - Инициализация коллекции
    private var collectionView : UICollectionView  = {
       // свойства
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       
        // конфигурации
        layout.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        layout.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //MARK: - инициализация
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //MARK: - Контейнер
        mainContainer.backgroundColor = UIColor(red: 218/256, green: 179/256, blue: 179/256, alpha: 1)
        contentView.addSubview(mainContainer)
        
        //SnapKit
        mainContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
   
        //MARK: - раздел популярные треки
        popularTitleLabel.text = "Популярные треки"
        popularTitleLabel.font = UIFont.systemFont(ofSize: 15)
        mainContainer.addSubview(popularTitleLabel)
        
        popularTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
            make.bottom.lessThanOrEqualToSuperview()

        }
        
        //MARK: - Коллекция
        collectionView.register(PopularSongsCollectionViewCell.self, forCellWithReuseIdentifier: PopularSongsCollectionViewCell.identifier)
        setupCollectionView()
        mainContainer.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(red: 218/256, green: 179/256, blue: 179/256, alpha: 1)

        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(popularTitleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
       
        
        //MARK: - allSongsOfArtistButton
        allSongsOfArtistButton = UIButton(type: .system)
        allSongsOfArtistButton.setTitle("Все песни", for: .normal)
        mainContainer.addSubview(allSongsOfArtistButton)
        
        allSongsOfArtistButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.trailing.bottom.equalToSuperview().inset(5)
            make.height.equalTo(20)
        }
       // allSongsOfArtistButton.addTarget(self, action: #selector(toggleExpansion), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   //MARK: - методы коллекции
    internal func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistSongs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSongsCollectionViewCell.identifier, for: indexPath) as? PopularSongsCollectionViewCell else { return UICollectionViewCell() }
        let song = artistSongs [indexPath.row]
        cell.configure( with: song)
        return cell
    }
}

extension PopularSongsOfArtistViewCell  : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Guidelines.PopularSongsWidthItem, height: Guidelines.PopularSongsHeightItem)
    }
}
