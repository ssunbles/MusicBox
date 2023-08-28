//
//  PopularSongsOfArtist.swift
//  MusicBox
//
//  Created by Айнур on 26.08.2023.
//

import UIKit

class PopularSongsOfArtistViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    //MARK: -инициализация переменных
    // экземпляр  песен артиста
    var artistSongs : [Song] = []
   
    enum Guidelines {
        static let PopularSongsHeightItem : CGFloat = 80
        static let PopularSongsWidthItem : CGFloat = 100
    }
    //  контейнер для коллекции и тайтл
    let mainContainer = UIView()
    let popularTitleLabel = UILabel()
    var allSongsOfArtistButton = UIButton()
    
    private var collectionView : UICollectionView  = {
       // свойства
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       
        // конфигурации
        layout.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        collectionView.backgroundColor = UIColor.black
        layout.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //MARK: - инициализация
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.register(PopularSongsCollectionViewCell.self, forCellWithReuseIdentifier: PopularSongsCollectionViewCell.identifier)
        setupCollectionView()
        allSongsOfArtistButton = UIButton(type: .system)
        
        //MARK: -Конфигурации вида
        mainContainer.backgroundColor = UIColor(red: 218/256, green: 179/256, blue: 179/256, alpha: 1)
        popularTitleLabel.text = "Популярные треки"
        popularTitleLabel.font = UIFont.systemFont(ofSize: 15)
        allSongsOfArtistButton.setTitle("Все песни", for: .normal)
        
        //MARK: -Добавление в родительские
        contentView.addSubview(mainContainer)
        mainContainer.addSubview(popularTitleLabel)
        mainContainer.addSubview(allSongsOfArtistButton)
        mainContainer.addSubview(collectionView)
        
        //MARK: - Ограничения
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        popularTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        allSongsOfArtistButton.translatesAutoresizingMaskIntoConstraints = false
       
        
        //SnapKit
        mainContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        popularTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
            make.bottom.lessThanOrEqualToSuperview()

        }
        
        allSongsOfArtistButton.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(5)
            make.height.equalTo(20)
        }
    
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(popularTitleLabel).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }


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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Guidelines.PopularSongsWidthItem, height: Guidelines.PopularSongsHeightItem)
    }
 
    
}


