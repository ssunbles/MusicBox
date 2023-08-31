//
//  OtherSongsCollectionCell.swift
//  MusicBox
//
//  Created by Айнур on 13.08.2023.
// new code


import UIKit

class OtherSongsSection : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    //MARK: - Свойства чтобы задать размеры
    enum Guidelines {
        static let otherSongCellHeightInCollection: CGFloat = 80
        static let otherSongCellWidthInCollection : CGFloat = 70
        static let otherSongFirstTitleForCell: CGFloat = 15
    }
    
    //MARK: - Свойства
    let containerView = UIView()
    let firstTitleOtherLabelOfSection = UILabel()
    weak var delegate: SongSelectionDelegate?
    var otherSongs: [Song] = []
    
    //MARK: - Инициализация коллекции
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout ()
        // задаем горизонтальную ориентацию
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        collectionView.backgroundColor = UIColor(red: 143/256, green: 139/256, blue: 187/256, alpha: 1)
        
        layout.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
            return collectionView
        }()

        override init (style: UITableViewCell.CellStyle, reuseIdentifier : String?)
     {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
         //MARK: - Контейнер
         containerView.backgroundColor = UIColor(red: 143/256, green: 139/256, blue: 187/256, alpha: 1)
         contentView.addSubview(containerView)
      // констреинт
         containerView.snp.makeConstraints { make in
          make.edges.equalToSuperview()
      }
        
    //MARK: - Коллекция
            //регистрируем ячейку перед использованием
        collectionView.register(OtherSongsCollectionView.self, forCellWithReuseIdentifier: "OtherSongsCollection")
        collectionView.delegate = self
        collectionView.dataSource = self
          //  collectionView.backgroundColor = UIColor.green
        collectionView.translatesAutoresizingMaskIntoConstraints = false
         
            
            //MARK: - Title of Section
        containerView.addSubview(firstTitleOtherLabelOfSection)
        firstTitleOtherLabelOfSection.text = "Другие песни"
        // firstTitleOtherLabelOfSection.backgroundColor = UIColor.gray
        firstTitleOtherLabelOfSection.font = UIFont.systemFont(ofSize: Guidelines.otherSongFirstTitleForCell)
         
         
         firstTitleOtherLabelOfSection.snp.makeConstraints {make in
                      make.top.equalToSuperview().inset(5)
                      make.leading.equalToSuperview().inset(20)
                      make.trailing.equalToSuperview().inset(20)
                      make.height.equalTo(20)
        }
            
         // добавляем коллекцию в ячейку
         containerView.addSubview(collectionView)
         
         collectionView.snp.makeConstraints { make in
                     make.top.equalTo(firstTitleOtherLabelOfSection.snp.bottom).offset(5) // Установите желаемый отступ здесь
                     make.leading.trailing.bottom.equalToSuperview()
                     make.height.equalTo(80)
                 }
         
        //MARK: - Массив данных
         // загружаем остальные песни, кроме текущей
        otherSongs = DataManager.songs.filter { $0 != DataManager.songs.first }
        }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    //MARK: -Методы коллекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherSongs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherSongsCollection", for: indexPath) as? OtherSongsCollectionView else {
            return UICollectionViewCell()
        }
        let song = otherSongs[indexPath.row]
        cell.configure(with: song)
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSong = otherSongs [indexPath.row]
        delegate?.didSelect(song: selectedSong)
    }
}
    //MARK: - Делегат
    protocol SongSelectionDelegate : AnyObject {
    func didSelect(song: Song)
}

extension OtherSongsSection: UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Guidelines.otherSongCellWidthInCollection, height: Guidelines.otherSongCellHeightInCollection)
    }
}






