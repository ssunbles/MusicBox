//
//  OtherArtistsViewCell.swift
//  MusicBox
//
//  Created by Айнур on 26.08.2023.
//

import UIKit

class OtherArtistsViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    //MARK: - Свойство для размеров
    enum Guidelines {
        static let otherArtistCellHeightInCollection : CGFloat = 80
        static let otherArtistCellWidthInCollection : CGFloat = 80
        static let otherArtistFirstTitleForCell : CGFloat = 15
    }
    //MARK: - Свойства
    let containerView = UIView()
    let firstTitleOtherArtistsLabelOfSection = UILabel()
    weak var delegate : ArtistSelectionDelegate?
    var otherArtists : [Artist] = []
    
    //MARK: - Инициализация коллекции
    var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        collectionView.backgroundColor = UIColor(red: 144/256, green: 194/256, blue: 181/256, alpha: 1)
        layout.scrollDirection = .horizontal
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //MARK: - Контейнер
        containerView.backgroundColor = UIColor(red: 144/256, green: 194/256, blue: 181/256, alpha: 1)
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        //MARK: - Коллекция
        collectionView.register(OtherArtistsCollectionView.self, forCellWithReuseIdentifier: OtherArtistsCollectionView.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //MARK: - Title of Section
        containerView.addSubview(firstTitleOtherArtistsLabelOfSection)
        firstTitleOtherArtistsLabelOfSection.text = "Другие артисты"
        firstTitleOtherArtistsLabelOfSection.font = UIFont.systemFont(ofSize: Guidelines.otherArtistFirstTitleForCell)
        
        firstTitleOtherArtistsLabelOfSection.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }
        containerView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(firstTitleOtherArtistsLabelOfSection.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(80)
        }
        
        //MARK: - Массив данных
        otherArtists = DataManager.artists.filter { $0 != DataManager.artists.first }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Методы коллекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherArtists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
                collectionView.dequeueReusableCell(withReuseIdentifier: OtherArtistsCollectionView.identifier, for: indexPath) as? OtherArtistsCollectionView else {
            return UICollectionViewCell()
        }
        let artist = otherArtists[indexPath.row]
        cell.configure(with: artist)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedArtist = otherArtists [indexPath.row]
        delegate?.didSelect(artist : selectedArtist)
    }
}
    //MARK: - Делегат
protocol ArtistSelectionDelegate : AnyObject {
    func didSelect(artist: Artist)
}
extension OtherArtistsViewCell : UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Guidelines.otherArtistCellWidthInCollection, height: Guidelines.otherArtistCellHeightInCollection)
    }
}
