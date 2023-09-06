//
//  OtherSongsCollectionView.swift
//  MusicBox
//
//  Created by Айнур on 31.08.2023.
//

import UIKit

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
        otherSongTitleLabel.textAlignment = .center
        
        if let songImage = song.songImage {
            otherSongImageLabel.image = songImage
        } else {
            otherSongImageLabel.image = UIImage(named: "default Image")
        }
    }
}

