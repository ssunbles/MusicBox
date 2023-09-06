//
//  ArtistAlbumsCollectionViewCell.swift
//  MusicBox
//
//  Created by Айнур on 06.09.2023.
//

import UIKit

class ArtistAlbumsCollectionViewCell: UICollectionViewCell {
    //MARK: - Свойства
    let artistAlbumNameLabel = UILabel()
    let artistAlbumImageLabel = UIImageView()
    
    override init (frame : CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        //MARK: - artistAlbumImageLabel
        contentView.addSubview(artistAlbumImageLabel)
        
        
        artistAlbumNameLabel.numberOfLines = 1 // Максимальное количество строк (1)
        artistAlbumNameLabel.lineBreakMode = .byTruncatingTail // Режим переноса текста с многоточием
        artistAlbumNameLabel.adjustsFontSizeToFitWidth = false // Отключение автоматического уменьшения шрифта
        artistAlbumNameLabel.minimumScaleFactor = 1.0 // Установка минимального масштаба шрифта (1.0, чтобы не масштабировать)

        artistAlbumImageLabel.contentMode = .scaleToFill
        artistAlbumImageLabel.snp.makeConstraints {make in
           // make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(120)
            make.leading.trailing.equalToSuperview()
        }
     
        //MARK: - artistAlbumNameLabel
        contentView.addSubview(artistAlbumNameLabel)
        
        artistAlbumNameLabel.snp.makeConstraints { make in
                make.top.equalTo(artistAlbumImageLabel.snp.bottom).offset(5)
                make.centerX.equalToSuperview()
                make.leading.greaterThanOrEqualToSuperview() // Не даем тексту выйти за левую границу - больше левого
                make.trailing.lessThanOrEqualToSuperview() // Не даем тексту выйти за правую границу - меньше правого
                make.height.equalTo(15)
                
                // Добавляем ограничение для выравнивания текста по центру, если текст короткий
                make.centerX.equalToSuperview().priority(.high) // Приоритет высокий
                make.width.lessThanOrEqualToSuperview() // Не даем тексту быть шире айтема
            }
    }
    
    func configure (with album : Album) {
        artistAlbumNameLabel.text = album.albumName
        artistAlbumImageLabel.image = album.albumImage
        artistAlbumNameLabel.font = UIFont.systemFont(ofSize: 10)
    }
}
