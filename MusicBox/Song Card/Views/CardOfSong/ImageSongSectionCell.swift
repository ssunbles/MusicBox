//
//  ImageSongSectionCell.swift
//  MusicBox
//
//  Created by Айнур on 13.08.2023.
// new code


import UIKit

class ImageSongSectionCell : UITableViewCell {
    let songImageView = UIImageView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        songImageView.contentMode = .scaleAspectFit
        songImageView.clipsToBounds = true
        contentView.addSubview(songImageView)
        
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            songImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            songImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            songImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            songImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            songImageView.heightAnchor.constraint(equalToConstant: 280)])
    }
    
}
