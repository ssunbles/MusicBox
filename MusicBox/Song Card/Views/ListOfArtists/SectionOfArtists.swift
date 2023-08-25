//
//  SectionOfArtisits.swift
//  MusicBox
//
//  Created by Айнур on 25.08.2023.
//

import UIKit

// Секция с артистами в ВьюКонтроллере со Списком Артистов
class SectionOfArtists : UITableViewCell {
    // Изображение Артиста
    var artistsImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // Имя Артиста
    let artistsTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Конфигурации для изображения
        artistsImageView.contentMode = .scaleToFill
        artistsImageView.layer.cornerRadius = artistsImageView.frame.size.width/2
        artistsImageView.clipsToBounds = true
        contentView.addSubview(artistsImageView)
        contentView.addSubview(artistsTitle)
        
        artistsImageView.translatesAutoresizingMaskIntoConstraints = false
        artistsImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.width.height.equalTo(50)
            make.centerY.equalTo(contentView)
        }
        
        // Конфигурации для Имени Артиста
        artistsTitle.translatesAutoresizingMaskIntoConstraints = false
        artistsTitle.snp.makeConstraints { make in
            make.leading.equalTo(artistsImageView.snp.trailing).offset(20)
            make.centerY.equalTo(contentView)
            
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
