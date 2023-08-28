//
//  PopularSongsCollectionViewCell.swift
//  MusicBox
//
//  Created by Айнур on 27.08.2023.
//

import UIKit

class PopularSongsCollectionViewCell: UICollectionViewCell {
    let popularSongsNameOfSongLabel = UILabel()
    let popularSongsImageOfSongLabel = UIImageView()
    let popularSongArtistNameLabel = UILabel()
    
    override init (frame : CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupViews() {
        contentView.addSubview(popularSongArtistNameLabel)
        contentView.addSubview(popularSongsNameOfSongLabel)
        contentView.addSubview(popularSongsImageOfSongLabel)
        
        
        
        popularSongsImageOfSongLabel.contentMode = .scaleToFill
        popularSongsImageOfSongLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
        popularSongsNameOfSongLabel.snp.makeConstraints {
            make in
            make.leading.equalTo(popularSongsImageOfSongLabel.snp.trailing)
            make.top.equalToSuperview()
            make.height.equalTo(20)
        }
        popularSongArtistNameLabel.snp.makeConstraints { make in
            make.top.equalTo(popularSongsNameOfSongLabel.snp.bottom)
            make.height.equalTo(20)
        }
    }
    
    func configure( with song : Song) {
        popularSongArtistNameLabel.text = song.songArtist.artistName
        popularSongsNameOfSongLabel.text = song.songName
        popularSongsImageOfSongLabel.image = song.songImage
        popularSongArtistNameLabel.font = UIFont.systemFont(ofSize: 10)
        popularSongsNameOfSongLabel.font = UIFont.systemFont(ofSize: 10)
    }
    
    
    
    
}
