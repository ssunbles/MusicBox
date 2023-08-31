//
//  PopularSongsCollectionViewCell.swift
//  MusicBox
//
//  Created by Айнур on 27.08.2023.
//

import UIKit

class PopularSongsCollectionViewCell: UICollectionViewCell {
    //MARK: - свойства
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
        
        //MARK: - popularSongsImageOfSongLabel
        contentView.addSubview(popularSongsImageOfSongLabel)
        
        popularSongsImageOfSongLabel.contentMode = .scaleToFill
        popularSongsImageOfSongLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        
        //MARK: - popularSongsNameOfSongLabel
        contentView.addSubview(popularSongsNameOfSongLabel)
        
        popularSongsNameOfSongLabel.snp.makeConstraints {
            make in
            make.leading.equalTo(popularSongsImageOfSongLabel.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(15)
        }
       
        
        //MARK: - popularSongArtistNameLabel
        contentView.addSubview(popularSongArtistNameLabel)
        
        popularSongArtistNameLabel.snp.makeConstraints { make in
            make.top.equalTo(popularSongsNameOfSongLabel.snp.bottom).offset(5)
            make.height.equalTo(15)
            make.leading.equalTo(popularSongsImageOfSongLabel.snp.trailing).offset(10)

        }
    }
    
    func configure( with song : Song) {
        popularSongArtistNameLabel.text = song.songArtist.artistName
        popularSongsNameOfSongLabel.text = song.songName
        popularSongsImageOfSongLabel.image = song.songImage
        popularSongArtistNameLabel.font = UIFont.systemFont(ofSize: 10)
        popularSongsNameOfSongLabel.font = UIFont.systemFont(ofSize: 10)
        contentView.backgroundColor = UIColor(red: 223/256, green: 219/256, blue: 219/256, alpha: 1)
    }
}
