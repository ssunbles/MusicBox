//
//  TitleSongSectionCell.swift
//  MusicBox
//
//  Created by Айнур on 13.08.2023.
//

import UIKit

class TitleSongSection: UITableViewCell {
    let songTitleLabel = UILabel()
    let songGenreLabel = UILabel()
    let songRatingLabel = UILabel()
    let containerView = UIView()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier : String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        containerView.backgroundColor = UIColor.brown
        containerView.addSubview(songTitleLabel)
        containerView.addSubview(songGenreLabel)
        containerView.addSubview(songRatingLabel)
        songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        songGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        songRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            songTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            songTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            songTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            songTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),

            songGenreLabel.topAnchor.constraint(equalTo: songTitleLabel.bottomAnchor),
            songGenreLabel.heightAnchor.constraint(equalToConstant: 20),
            songGenreLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            songGenreLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            songGenreLabel.topAnchor.constraint(equalTo: songTitleLabel.bottomAnchor, constant: 10),
            
            songRatingLabel.topAnchor.constraint(equalTo: songGenreLabel.bottomAnchor),
            songRatingLabel.heightAnchor.constraint(equalToConstant: 20),
            songRatingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            songRatingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        ])
    }
    func configure(with song: Song) {
          songTitleLabel.text = (song.songName ?? "Unknown Song") + " - " + (song.artistName ?? "Unknown Artist")
        songTitleLabel.textColor = UIColor.white
        songGenreLabel.text = "Genre: " + (song.genreName ?? "Unknown Song")
        songGenreLabel.textColor = UIColor.white
        songRatingLabel.text = "Songs rating: " + String((song.ratingNumber ?? 0))
        songRatingLabel.textColor = UIColor.white
        songTitleLabel.font = UIFont.systemFont(ofSize: 19)
        songGenreLabel.font = UIFont.systemFont(ofSize: 14)
        songRatingLabel.font = UIFont.systemFont(ofSize: 14)
      }
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
  }
