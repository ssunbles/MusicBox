//
//  OtherSongsCollectionCell.swift
//  MusicBox
//
//  Created by Айнур on 13.08.2023.
// new code


import UIKit

protocol SongSelectionDelegate : AnyObject {
    func didSelect(song: Song)
}

class OtherSongsSection : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    enum Guidelines {
        static let otherSongCellHeightInCollection: CGFloat = 150
        static let otherSongFirstTitleForCell: CGFloat = 15
    }
    
        let containerView = UIView()
        let firstTitleOtherLabelOfSection = UILabel()
        weak var delegate: SongSelectionDelegate?
        var otherSongs: [Song] = []
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
            
            //регистрируем ячейку перед использованием
            collectionView.register(OtherSongsCollectionView.self, forCellWithReuseIdentifier: "OtherSongsCollection")

            collectionView.delegate = self
            collectionView.dataSource = self
          //  collectionView.backgroundColor = UIColor.green
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            
            containerView.translatesAutoresizingMaskIntoConstraints = false
            firstTitleOtherLabelOfSection.translatesAutoresizingMaskIntoConstraints = false
            containerView.backgroundColor = UIColor(red: 143/256, green: 139/256, blue: 187/256, alpha: 1)
            contentView.addSubview(containerView)
            containerView.addSubview(firstTitleOtherLabelOfSection)
            firstTitleOtherLabelOfSection.text = "Другие песни"
           // firstTitleOtherLabelOfSection.backgroundColor = UIColor.gray
            firstTitleOtherLabelOfSection.font = UIFont.systemFont(ofSize: Guidelines.otherSongFirstTitleForCell)
            
            // загружаем остальные песни, кроме текущей
            otherSongs = DataManager.songs.filter { $0 != DataManager.songs.first }

            // констреинт
            containerView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
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
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    //MARK: -Методы коллекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherSongs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherSongsCollection", for: indexPath) as! OtherSongsCollectionView
        let song = otherSongs[indexPath.row]
        cell.configure(with: song)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSong = otherSongs [indexPath.row]
        delegate?.didSelect(song: selectedSong)
    }
}

// MARK: - Collection Cell

class OtherSongsCollectionView : UICollectionViewCell {
   
    let otherSongTitleLabel = UILabel()
    let otherSongImageLabel = UIImageView()
    
    override init (frame : CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(otherSongImageLabel)
        contentView.addSubview(otherSongTitleLabel)
        
      //  otherSongImageLabel.contentMode = .scaleAspectFit
        
        otherSongImageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(otherSongTitleLabel.snp.top)
            make.height.equalTo(80)
        }
        otherSongTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(otherSongImageLabel.snp.bottom)
            make.bottom.lessThanOrEqualToSuperview()
        }
    }
    func configure(with song: Song) {
        otherSongTitleLabel.text = song.songName ?? "Unknown Song"
        otherSongTitleLabel.font = UIFont.systemFont(ofSize: 10)
       // contentView.backgroundColor = UIColor.purple
        
        if let songImage = song.songImage {
            otherSongImageLabel.image = songImage
        } else {
            otherSongImageLabel.image = UIImage(named: "default Image")
        }
    }
}
