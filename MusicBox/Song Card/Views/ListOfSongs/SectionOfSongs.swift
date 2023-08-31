//
//  SectionOfSongs.swift
//  MusicBox
//
//  Created by Айнур on 26.08.2023.
//

import UIKit

class SectionOfSongs : UITableViewCell  {
    // расписываем элементы ячейки с песней
    let songImageView : UIImageView = {
        let imageView = UIImageView()
        // нужно установить размерность изображения
        return imageView
    }()
    
    let songTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20) // меняем размер шрифта
        return label
    }()
    let artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14) // меняем размер шрифта
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        //MARK: - songImageView
        songImageView.contentMode = .scaleAspectFill
        songImageView.clipsToBounds = true
        contentView.addSubview(songImageView)
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            songImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            songImageView.widthAnchor.constraint(equalToConstant: 50),
            songImageView.heightAnchor.constraint(equalToConstant: 50),
            songImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        //MARK: - songTitle
        contentView.addSubview(songTitle)
        songTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            songTitle.leadingAnchor.constraint(equalTo: songImageView.trailingAnchor, constant: 10),
            songTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ])
        
        //MARK: - artistLabel
        contentView.addSubview(artistLabel)
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: songImageView.trailingAnchor, constant: 10),
            artistLabel.topAnchor.constraint(equalTo: songTitle.bottomAnchor, constant: 10)
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

